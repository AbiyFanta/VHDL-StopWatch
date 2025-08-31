library ieee;

use ieee.std_logic_1164.all;

entity stopwatch is port(
	start, stop, clk, reset:in std_logic;
	y2, y1, y0:out std_logic_vector(3 downto 0));
end stopwatch;

architecture arch1 of stopwatch is
	signal en, clk2: std_logic;
	
	component clkdiv port(
		clkin:in std_logic; clkout:out std_logic);
	end component;
	
	component fsm port(
		clk, reset, start, stop:in std_logic; en:out std_logic);
	end component;
	
	component watch is port(
		clk, en, reset:in std_logic; y2, y1, y0:out std_logic_vector(3 downto 0));
	end component;
begin
	g1:clkdiv port map(clkin=>clk,clkout=>clk2);
	g2:fsm port map(start=>start,stop=>stop,clk=>clk2,reset=>reset,en=>en);
	g3:watch port map(clk=>clk2,en=>en,reset=>reset,y2=>y2,y1=>y1,y0=>y0);
end arch1;