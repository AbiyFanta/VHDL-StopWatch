library ieee;

use ieee.std_logic_1164.all;

entity clkdiv_tb is
end clkdiv_tb;

architecture tbarch of clkdiv_tb is
	signal clkin:std_logic:='0';
	signal clkout:std_logic;
	
	component clkdiv Port(clkin:in std_logic; clkout:out std_logic);
	end component;
	
begin
	uut:clkdiv port map(clkin=>clkin, clkout=>clkout);
	
	stimulus:process begin
		clkin<='0';
		wait for 125 ms;
		clkin<= '1';
		wait for 125 ms;
	end process;
end tbarch;