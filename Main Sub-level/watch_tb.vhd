library ieee;

use ieee.std_logic_1164.all;

entity watch_tb is
end watch_tb;

architecture Behavioral of watch_tb is
	signal clk,en, reset:std_logic:='0';
	signal y2,y1,y0:std_logic_vector(3 downto 0);
	
	component watch port(
		clk, en, reset:in std_logic; y2,y1,y0:out std_logic_vector(3 downto 0));
	end component;
	
begin
	uut:watch port map(clk=>clk,en=>en,reset=>reset,y2=>y2,y1=>y1,y0=>y0);
	
	clk_process:process begin
		clk<='0';
		wait for 500 ms;
		clk<='1';
		wait for 500 ms;
	end process;
	
	stimulus:process begin
		reset<='1';
		wait for 1 sec;
		reset<='0';
		
		en<='1';
		wait for 10 sec;
		
		en<='0';
		wait for 5 sec;
		
		en<='1';
		wait for 20 sec;
		
		reset<='1';
		wait for 1 sec;
		reset<='0';
		
		wait;
	end process;
end Behavioral;