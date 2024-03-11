library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use ieee.numeric_std.all;
-- how UAT will work:
	-- on rising edge, if send is up, it sends; and set status to busy
	-- on completion (when sending finished bit) sets busy to `0`
	-- don't have latch on input data

-- handle only xN1
entity uat is
	Generic (
		send_bits: integer := 8
	);
	Port ( 
		   clk_i : in STD_LOGIC;
           data_i : in STD_LOGIC_VECTOR (send_bits-1 downto 0);
           TRX : out STD_LOGIC := '1';
           busy_o : out STD_LOGIC;
           send_i : in STD_LOGIC);
end uat;

architecture Behavioral of uat is

signal busy : STD_LOGIC := '0';
type UatState is (waiting, requested, sending);
signal state: UatState := waiting;
begin
	busy_o <= busy;
	
	process (send_i, clk_i) 
	variable nbit : integer range 0 to send_bits := 0;
	begin
		if send_i = '1' and state = waiting then
			state <= requested;
			busy <= '1';
		elsif rising_edge(clk_i) then
			if state = sending then
				if nbit < send_bits then
					TRX <= data_i(nbit);
					nbit := nbit + 1;
				else
					busy <= '0';
					state <= waiting;
					TRX <= '1';
				end if;
			
			elsif state = requested then
				nbit := 0;
				state <= sending;
				busy <= '1';
				TRX <= '0'; -- start bit
			end if;
		end if;
	end process;
	
	process 
	begin
		wait until rising_edge(clk_i);

	end process;


end Behavioral;
