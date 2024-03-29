library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.NUMERIC_STD.ALL;

-- reference: https://onlinedocs.microchip.com/oxy/GUID-199548F4-607C-436B-80C7-E4F280C1CAD2-en-US-1/GUID-5656F99B-1F98-4042-88B8-47B31B93D1A6.html
-- clock: 100MHz = 100_000_000 Hz
-- baud rate: 9600 bps
-- samples: 16
-- divisor: 100_000_000/16/9600 = 651.041666667
-- Integer Divisor Factor = 651
-- Fractional Divisor Factor = 1
-- Fractional Divisor Cycle = 16
--
-- 100_000_000/16/(651 + 1/6) = 9598.16
-- that gives -0.00019166666% error


-- with legacy (from previous labs) divider:
--- 100_000_000/16/652 = 9585.89
--- (9585.89-9600)/9600 = -0.00146979166%
-- 8N1 error tolerance is about 3% (assuming synchonizing to start)
-- so I can use legacy module for that


entity top is
    Port ( clk_i : in STD_LOGIC;
           RXD_i : in STD_LOGIC;
           TXD_o : out STD_LOGIC;
           ld0 : out STD_LOGIC := '0';
           led7_an_o : out STD_LOGIC_VECTOR (3 downto 0);
           led7_seg_o : out STD_LOGIC_VECTOR (7 downto 0));
end top;

architecture Behavioral of top is
	component uar is
		Generic(
			data_n : integer;
			sampling_rate: integer
		); Port (
			clk_i : in STD_LOGIC;
			rst_i : in STD_LOGIC;
			RXD_i : in STD_LOGIC;
			ready_o: out STD_LOGIC;
			data_o: out STD_LOGIC_VECTOR(data_n-1 downto 0));
	end component;
	
	component display is
		Generic (
			clk_ratio : integer := 100_000
		); Port ( 
			clk_i : in STD_LOGIC;
	        rst_i : in STD_LOGIC;
	        digit_i : in STD_LOGIC_VECTOR (31 downto 0);
	        led7_an_o : out STD_LOGIC_VECTOR (3 downto 0);
	        led7_seg_o : out STD_LOGIC_VECTOR (7 downto 0));
	end component;

	component clk_div is
		Generic(
			divisior : integer
		); Port ( 
			clk_i : in STD_LOGIC;
	    	rst_i : in STD_LOGIC;
	        clk_o : out STD_LOGIC);
	end component;
	
	component hex2seg is
	    Port ( hex_i : in STD_LOGIC_VECTOR (3 downto 0);
	           seg_o : out STD_LOGIC_VECTOR (7 downto 0));
	end component;
	
	COMPONENT char_memory
		  PORT (
			clka : IN STD_LOGIC;
			addra : IN STD_LOGIC_VECTOR(11 DOWNTO 0);
			douta : OUT STD_LOGIC_VECTOR(7 DOWNTO 0)
		  );
	END COMPONENT;
	
	COMPONENT fifo_mewmory
	  PORT (
	    clk : IN STD_LOGIC;
	    din : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
	    wr_en : IN STD_LOGIC;
	    rd_en : IN STD_LOGIC;
	    dout : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
	    full : OUT STD_LOGIC;
	    empty : OUT STD_LOGIC
	  );
	END COMPONENT;
	
	component pulse_generator is
	    Port ( clk : in STD_LOGIC;
	           signal_i : in STD_LOGIC;
	           pulse_o : out STD_LOGIC);
	end component;

	component uat is
		Generic (
			send_bits: integer := 8
		);
		Port ( clk_i : in STD_LOGIC;
	           data_i : in STD_LOGIC_VECTOR (send_bits-1 downto 0);
	           TRX : out STD_LOGIC := '1';
	           busy_o : out STD_LOGIC;
	           send_i : in STD_LOGIC);
	end component;

signal uar_clk : STD_LOGIC := '0';
signal uat_clk : STD_LOGIC := '0';

signal ready : STD_LOGIC := '0';
signal recieved : STD_LOGIC := '0';
signal uar_data : STD_LOGIC_VECTOR(7 downto 0);
signal uat_send_data : STD_LOGIC_VECTOR(7 downto 0);
signal disp_seg : STD_LOGIC_VECTOR(31 downto 0) := x"FFFFFFFF";

signal fifo_wr_sig : STD_LOGIC := '0';
signal fifo_wr_pulse : STD_LOGIC := '0';
signal fifo_rd_sig : STD_LOGIC := '0';
signal fifo_rd_pulse : STD_LOGIC := '0';
signal fifo_rd_data : STD_LOGIC_VECTOR(7 downto 0);
signal fifo_full : STD_LOGIC := '0';
signal fifo_empty : STD_LOGIC := '0';

signal uat_sig : STD_LOGIC := '0';
signal uat_pulse : STD_LOGIC := '0';
signal uat_busy : STD_LOGIC := '1';

--						0		1		2		3		4		5		6		7		8
type SenderState is (accept, ld_req, ld_wait, ld_rec, sd_req, sd_wait, sd_send, sd_CR, sd_LF);
signal current_state : SenderState := accept;

signal rom_addr : STD_LOGIC_VECTOR(11 downto 0);
signal rom_result : STD_LOGIC_VECTOR(7 downto 0);

signal ready_to_send : STD_LOGIC := '0';

type l_Array is array (0 to 17) of STD_LOGIC_VECTOR(7 downto 0);
signal letters : l_Array := (others => "00000000");

signal n_buff_chars : integer := 0;
signal n_chars : integer := 0;

constant character_width : integer := 8;
constant character_height : integer := 16;
constant max_chars : integer := 18;

begin

	fifo_pulsec1: pulse_generator Port map(
		clk => clk_i,
		signal_i => fifo_wr_sig,
		pulse_o => fifo_wr_pulse
	);
	
	fifo_pulsec2: pulse_generator Port map(
		clk => clk_i,
		signal_i => fifo_rd_sig,
		pulse_o => fifo_rd_pulse
	);
	
	uat_pulsec: pulse_generator Port map(
		clk => uat_clk,
		signal_i => uat_sig,
		pulse_o => uat_pulse
	);
	
	uatc: uat Port map(
		clk_i => uat_clk,
		data_i => uat_send_data,
		TRX => TXD_o,
		busy_o => uat_busy,
		send_i => uat_pulse
	);
	
	
	uat_clkc: clk_div Generic map(
			divisior => 10416
		) Port map(
			clk_i => clk_i,
			rst_i => '0',
			clk_o => uat_clk
		);
	
	uar_clkc: clk_div Generic map(
		divisior => 652
	) Port map(
		clk_i => clk_i,
		rst_i => '0',
		clk_o => uar_clk
	);
	
	uarc: uar Generic map(
		data_n => 8,
		sampling_rate => 16
	) Port map (
		clk_i => uar_clk,
		rst_i => '0',
		RXD_i => RXD_i,
		ready_o => ready,
		data_o => uar_data
	);
	
	dispc: display 
	Generic map(
		clk_ratio => 1000
	) Port map(
		clk_i => clk_i,
		rst_i => '0',
		digit_i => disp_seg,
		led7_an_o => led7_an_o,
		led7_seg_o => led7_seg_o
	);
	
	-- NOTE: is recieves good information
	-- but it probaly don't show overflow at all, is it at all stored in fifo??
	hexc1: hex2seg Port map(
		hex_i => uar_data(3 downto 0),
		seg_o => disp_seg(7 downto 0)
	);
	
	hexc2: hex2seg Port map(
		hex_i => uar_data(7 downto 4),
		seg_o => disp_seg(15 downto 8)
	);
	
	char_memc : char_memory
	  PORT MAP (
	    clka => clk_i,
	    addra => rom_addr,
	    douta => rom_result
	  );
	  
	fifo_memc : fifo_mewmory
  PORT MAP (
    clk => clk_i,
    din => uar_data,
    wr_en => fifo_wr_pulse,
    rd_en => fifo_rd_pulse,
    dout => fifo_rd_data,
    full => fifo_full,
    empty => fifo_empty
  );


-- I need to put everything here.. damn
process
	variable reading_letter : integer := 0;
	variable send_char_no : integer := 0;
	variable line_no : integer := 0;
	variable pixel_no : integer := 0;
begin

wait until rising_edge(clk_i);

-- handle recieving
if ready = '1' then
	if fifo_full = '0' and recieved = '0' then
		if uar_data = 13 and current_state = accept then -- ignore ENTER while printing out
			ready_to_send <= '1';
		elsif uar_data /= 13 then
			n_chars <= n_chars + 1; 
			fifo_wr_sig <= not fifo_wr_sig; -- todo: somehow this is set only once, and gets reset when I hit enter..
		end if;
		recieved <= '1';
	end if;
elsif recieved = '1' then
	recieved <= '0';
end if;


case current_state is
	when accept =>
		if n_chars >= max_chars or ready_to_send = '1' then
			if n_chars >= max_chars then
				n_buff_chars <= max_chars;
				n_chars <=  n_chars - max_chars;
			else
				n_buff_chars <= n_chars;
				n_chars <= 0;
			end if;

			ready_to_send <= '0';
			reading_letter := 0;
			current_state <= ld_req;
		end if;
	when ld_req =>
		fifo_rd_sig <= not fifo_rd_sig;
		current_state <= ld_wait;
	when ld_wait =>
		current_state <= ld_rec;
	when ld_rec =>
		letters(reading_letter) <= fifo_rd_data;
		if reading_letter + 1 < n_buff_chars then
			reading_letter := reading_letter + 1;
			current_state <= ld_req;
		else
			current_state <= sd_req;
		end if;
	
	when sd_req =>
		rom_addr <= letters(send_char_no) & std_logic_vector(to_unsigned(line_no, 4));
		current_state <= sd_wait;
	when sd_wait =>
		if uat_busy = '0' then
			current_state <= sd_send;
		end if;
	when sd_send =>			
		if pixel_no + 1 < character_width and send_char_no < n_buff_chars  then			
			if rom_result(character_width-pixel_no-1) = '1' then
				if (unsigned(letters(send_char_no)) < 32) or (127 < unsigned(letters(send_char_no))) then
					uat_send_data <= std_logic_vector(to_unsigned(character'pos('*'), 8));
				else
					uat_send_data <= letters(send_char_no);
				end if;
			else
				uat_send_data <= std_logic_vector(to_unsigned(character'pos(' '), 8));
			end if;
				
			uat_sig <= not uat_sig;
			pixel_no := pixel_no + 1;
			current_state <= sd_wait;
			
		else
			pixel_no := 0;
			if send_char_no + 1 < n_buff_chars then
				send_char_no := send_char_no + 1;
				current_state <= sd_req;
			else
				send_char_no := 0;
				current_state <= sd_CR;
			end if;
		end if;
	when sd_CR =>
		if uat_busy = '0' then
			uat_send_data <= std_logic_vector(to_unsigned(13, 8));
			uat_sig <= not uat_sig;
			current_state <= sd_LF;
		end if;
	when sd_LF =>
		if uat_busy = '0' then
			uat_send_data <= std_logic_vector(to_unsigned(10, 8));
			uat_sig <= not uat_sig;
			current_state <= sd_req;
			
			if line_no + 1 < character_height then
				line_no := line_no + 1;
			else
				line_no := 0;
				current_state <= accept;
			end if;
		end if;

	end case;
end process;

ld0 <= fifo_full;

end Behavioral;
