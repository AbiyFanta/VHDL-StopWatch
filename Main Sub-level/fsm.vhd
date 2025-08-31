library ieee;

use ieee.std_logic_1164.all;

entity fsm is
	port(clk, reset, start, stop:in std_logic; en:out std_logic);
end fsm;

architecture fsmarch of fsm is
begin
	process(clk, reset) begin
		if reset='1' then
			en<='0';
		elsif(rising_edge(clk)) then
			if(start='1' and stop='0') then
				en<='1';
			else
				en<='0';
			end if;
		end if;
	end process;
end fsmarch;