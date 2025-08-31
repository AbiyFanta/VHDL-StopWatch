library ieee;

use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity clkdiv is
	Port(clkin:in std_logic; clkout:out std_logic);
end clkdiv;

architecture Behavioral of clkdiv is
	signal cnt:std_logic_vector(1 downto 0):="00";
	signal temp:std_logic:='0';
begin
	process(clkin)
	begin
		if rising_edge(clkin) then
			if cnt = "11" then
				cnt <= "00";
				temp <= not temp;
			else
				cnt<=cnt+1;
			end if;
		end if;
		clkout<=temp;
	end process;
end Behavioral;