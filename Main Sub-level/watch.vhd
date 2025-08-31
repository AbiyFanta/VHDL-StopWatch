library ieee;

use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity watch is port(
	clk, en, reset:in std_logic; y2,y1,y0:out std_logic_vector(3 downto 0));
end watch;

architecture Behavioral of watch is
	signal count1,count2, count3:std_logic_vector(3 downto 0);
begin
	process(clk,reset) begin
		if(reset='1') then
			count3<="0000";
			count2<="0000";
			count1<="0000";
		elsif(rising_edge(clk)) then
			if(en='1') then -- Keeping it decimal
				if count1="1001" then
					count1<="0000";
					count2<=count2+'1';
					if count2="1001" then
						count2<="0000";
						count3<=count3+'1';
						if count3="1001" then
							count3<= "0000";
						end if;
					end if;
				else -- increment
					count1<=count1+'1';
				end if;
			else -- idle
				count3<=count3;
				count2<=count2;
				count1<=count1;
			end if;
		end if;
	end process;
	
	y2<=count3;
	y1<=count2;
	y0<=count1;

end Behavioral;