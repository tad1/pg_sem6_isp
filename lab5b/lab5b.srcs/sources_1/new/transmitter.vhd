library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity transmitter is
	Generic (
		h_vis : integer := 640-1;
		h_front: integer := 16-1;
		h_sync: integer := 96-1;
		h_back: integer := 48-1;
		
		v_vis: integer := 480-1;
		v_front: integer := 10-1;
		v_sync: integer := 2-1;
		v_back: integer := 33-1;
		
		size_x: integer := 384;
		size_y: integer := 384
	);
    Port ( clk : in STD_LOGIC; -- pixel, clock (25MHz)
           pixel_value : in STD_LOGIC;
           pixel_addr : out STD_LOGIC_VECTOR (17 downto 0);
           red_o : out STD_LOGIC_VECTOR (3 downto 0);
           green_o : out STD_LOGIC_VECTOR (3 downto 0);
           blue_o : out STD_LOGIC_VECTOR (3 downto 0);
           hsync_o : out STD_LOGIC;
           vsync_o : out STD_LOGIC
           );
end transmitter;

architecture Behavioral of transmitter is
	constant h_vis_front : integer := (h_vis - size_x) / 2;
	constant h_vis_back : integer := (h_vis - size_x) / 2 + (h_vis - size_x + 1) mod 2;
	constant h_vis_x : integer := size_x - 1;
	constant h_vis_y : integer := size_y - 1;
	
	constant v_vis_front : integer := (v_vis - size_y) / 2;
	constant v_vis_back : integer := (v_vis - size_y) / 2 + (v_vis - size_y + 1) mod 2;
	
	
	type TRState is (front_vis, vis_area, back_vis, front, sync, back);
	signal h_state : TRState := sync;
	signal v_state : TRState := sync;
	signal v_counter : integer := 0;
	signal h_counter : integer := 0;
	signal pixel_en : STD_LOGIC := '0';
begin
	process 
	variable tmp: integer := 0;
	begin
	wait until rising_edge(clk);
		if(h_counter >= h_back) and h_state = back then
			v_counter <= v_counter + 1;
		end if;
		h_counter <= h_counter + 1;
		pixel_en <= pixel_value;

		case h_state is
			when front_vis =>
				if(h_counter >= h_vis_front) then
					h_counter <= 0;
					-- this could be function?
					tmp := (v_counter * 384) + 0;
					pixel_addr <= std_logic_vector(to_unsigned(tmp, 18));
					h_state <= vis_area;
				end if;
			when vis_area =>
				if(h_counter >= h_vis_x) then
					h_counter <= 0;
					h_state <= back_vis;
				elsif(h_counter + 1 < h_vis) then
					tmp := (v_counter * 384) + h_counter + 1;
					pixel_addr <= std_logic_vector(to_unsigned(tmp, 18));
				end if;
			
			-- ah yeah.. the smell of  error-prune code redundancy at the midnight!
			when back_vis =>
				if(h_counter >= h_vis_back) then
					h_counter <= 0;
					h_state <= front;
				end if;
			when front =>
				if(h_counter >= h_front) then
					h_counter <= 0;
					h_state <= sync;
				end if;
			when sync =>
				if(h_counter >= h_sync) then
					h_counter <= 0;
					h_state <= back;
				end if;
			when back =>
				if(h_counter >= h_back) then
					h_counter <= 0;
					h_state <= front_vis;
				end if;
		end case;
		
		case v_state is
			when front_vis =>
				if(v_counter >= v_vis_front) then
					v_counter <= 0;
					v_state <= vis_area;
				end if;
			when vis_area =>
				if(v_counter >= h_vis_y) then
					v_counter <= 0;
					v_state <= back_vis;
				end if;
			when back_vis =>
				if(v_counter >= v_vis_back) then
					v_counter <= 0;
					v_state <= front;
				end if;
			when front =>
				if(v_counter >= v_front) then
					v_counter <= 0;
					v_state <= sync;
				end if;
			when sync =>
				if(v_counter >= v_sync) then
					v_counter <= 0;
					v_state <= back;
				end if;
			when back =>
				if(v_counter >= v_back) then
					v_counter <= 0;
					v_state <= front_vis;
				end if;
		end case;
		
	end process;
	
	hsync_o <= '0' when h_state = sync else '1';
	vsync_o <= '0' when v_state = sync else '1';
	
	red_o <= "1111" when pixel_en = '1' and (h_state = vis_area) and (v_state = vis_area) else "0000";
	green_o <= "1111" when pixel_en = '1' and (h_state = vis_area) and (v_state = vis_area) else "0000";
	blue_o <= "1111" when pixel_en = '1' and (h_state = vis_area) and (v_state = vis_area) else "0000";

end Behavioral;
