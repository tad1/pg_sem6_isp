library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- UNIVERSAL Asynchronous REceiver (UART without Transmission)
-- based on: https://robo-tronix.weebly.com/uploads/2/3/2/1/23219916/uart_design_doc.pdf

entity uar is
	Generic(
		data_n : integer;
		sampling_rate: integer
		);
	Port(
		clk_i : in STD_LOGIC;
		RXD_i : in STD_LOGIC;
		ready_o: out STD_LOGIC := '0';
		data_o: out STD_LOGIC_VECTOR(data_n-1 downto 0)
	);
end uar;

architecture Behavioral of uar is
type State is (waiting, skip, data);
constant sampling_tick : integer := sampling_rate / 2;
begin
	
	dec: process(clk_i) is
	variable tick: integer := 0; -- tick range(1 to 16)
	variable nbit: integer := 0; -- nbit range(0 to 7)
	variable current_state : State  := waiting;
	variable prev_value : STD_LOGIC := '0';
	begin

		case current_state is
			when waiting =>
				if prev_value = '1' and RXD_i = '0' then
					ready_o <= '0';
					tick := 0;
					current_state := skip;
				else
					prev_value := RXD_i;
				end if;
			when skip =>
				tick := tick + 1;
				if tick = sampling_rate then
					tick := 0;
					current_state := data;
					ready_o <= '0';
					nbit := 0;
				end if;
			when data =>
				tick := tick + 1;
				if tick = sampling_tick then
					data_o(nbit) <= RXD_i;
					nbit := nbit + 1;
				elsif tick = sampling_rate then
					tick := 0;
					if nbit = data_n then
						ready_o <= '1';
						current_state := waiting;
						prev_value := '0';
					end if;
				end if;
		end case;

	end process;

end Behavioral;
