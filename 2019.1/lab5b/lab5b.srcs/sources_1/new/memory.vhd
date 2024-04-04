library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity memory is
	Generic(
		x_size : integer := 384;
		y_size : integer := 384
	);
    Port ( clk_i : in STD_LOGIC;
           w_en : in STD_LOGIC;
           w_addr : in STD_LOGIC_VECTOR(17 DOWNTO 0);
           w_data : in STD_LOGIC;
           r_addr : in STD_LOGIC_VECTOR(17 DOWNTO 0);
           r_data : out STD_LOGIC;
           clear : in STD_LOGIC;
           busy : out STD_LOGIC);
end memory;

architecture Behavioral of memory is
	COMPONENT video_mem
	  PORT (
		clka : IN STD_LOGIC;
		wea : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
		addra : IN STD_LOGIC_VECTOR(17 DOWNTO 0);
		dina : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
		clkb : IN STD_LOGIC;
		addrb : IN STD_LOGIC_VECTOR(17 DOWNTO 0);
		doutb : OUT STD_LOGIC_VECTOR(0 DOWNTO 0)
	  );
	END COMPONENT;
	type MemoryState is (working, clearing);
	signal state : MemoryState := clearing;
	signal clr_x : integer := 0;
	signal clr_y : integer := 0;
	signal int_write_data : STD_LOGIC := '0';
	signal int_write_addr : STD_LOGIC_VECTOR(17 DOWNTO 0);
	signal int_write_enable : STD_LOGIC := '0';
begin
	process begin
		wait until rising_edge(clk_i);
		case state is
			when working =>
				if(clear = '1') then
					busy <= '1';
					state <= clearing;
				end if;
			when clearing =>
				if(clr_x + 1 >= x_size) then
					clr_x <= 0;
					if(clr_y + 1 >= y_size) then
						clr_y <= 0;
						state <= working;
						busy <= '0';
					else
						clr_y <= clr_y + 1;
					end if;
				else
					clr_x <= clr_x + 1;
				end if;
		end case;
	end process;
	video_memc : video_mem
	  PORT MAP (
	    clka => clk_i,
	    wea(0) => int_write_enable,
	    addra => int_write_addr,
	    dina(0) => int_write_data,
	    clkb => clk_i,
	    addrb => r_addr,
	    doutb(0) => r_data
	  );
	  
	  int_write_data <= '0' when state = clearing else '1';
	  int_write_enable <= '1' when state = clearing else w_en;
	  int_write_addr <= std_logic_vector(to_unsigned(clr_y, 9)) & std_logic_vector(to_unsigned(clr_x, 9)) when state = clearing else w_addr; 
	  
	
end Behavioral;
