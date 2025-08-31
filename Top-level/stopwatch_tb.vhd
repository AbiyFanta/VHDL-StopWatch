library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity stopwatch_tb is
end stopwatch_tb;

architecture Behavioral of stopwatch_tb is
    -- Signals to connect to the stopwatch component
    signal start, stop, clk, reset : std_logic := '0';
    signal y2, y1, y0 : std_logic_vector(3 downto 0);
    
    -- Component declaration
    component stopwatch port(
		start,stop,clk,reset:in std_logic;
		y2,y1,y0:out std_logic_vector(3 downto 0));
    end component;

begin
    -- Instantiate the stopwatch component
    uut: stopwatch port map(
        start=>start,stop=>stop,clk=>clk,reset=>reset,y2=>y2,y1=>y1,y0=>y0);

    -- Generate a 4 Hz clock for `clk` input
    clk_process:process
    begin
        clk <= '0';
        wait for 125 ns;
        clk <= '1';
        wait for 125 ns;
    end process;

    -- Test sequence
    stimulus:process
    begin
        -- Initial reset to set counter to zero
        reset <= '1';
        wait for 250 ns;
        reset <= '0';
        
        -- Start the stopwatch
        start <= '1';
		  stop<='0';
        wait for 50000 ns;
		  reset<='1';
		  wait for 600 ns;
		  reset<='0';
		  start<='1';
		  stop<='0';
		  wait for 10000 ns;

        -- Stop the stopwatch
		  start<='0';
        stop <= '1';
        wait for 500 ns;
        stop <= '0';
        wait for 500 ns;  -- Hold the current count

        -- Reset while running
		  start<='1';
        reset <= '1';
        wait for 500 ns;
		  start<='0';
        wait for 500 ns;
		  reset<='0';
		  wait for 500 ns;

        wait;
    end process;
end Behavioral;
