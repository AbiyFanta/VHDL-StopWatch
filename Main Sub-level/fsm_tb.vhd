library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity fsm_tb is
end fsm_tb;

architecture Behavioral of fsm_tb is
    signal clk : std_logic := '0';
    signal reset : std_logic := '0';
    signal start : std_logic := '0';
    signal stop : std_logic := '0';
    signal en : std_logic;
    
    component fsm
        Port ( clk : in STD_LOGIC;
               reset : in STD_LOGIC;
               start : in STD_LOGIC;
               stop : in STD_LOGIC;
               en : out STD_LOGIC);
    end component;
    
begin
    DUT: fsm port map(clk => clk, reset => reset, start => start, stop => stop, en => en);

    -- Generate a clock with a period of 1 second (1 Hz)
    process
    begin
        clk <= '0';
        wait for 500 ms;
        clk <= '1';
        wait for 500 ms;
    end process;

    -- Test sequence
    process
    begin
        -- Initial reset
        reset <= '1';
        wait for 1 ns;
        reset <= '0';
        wait for 1 sec;
        
        -- Start the stopwatch
        start <= '1';
        wait for 1 sec;
        start <= '0';
        wait for 3 sec;
        
        -- Stop the stopwatch
        stop <= '1';
        wait for 1 sec;
        stop <= '0';
        wait for 2 sec;

        -- Start again
        start <= '1';
        wait for 1 sec;
        start <= '0';
        wait for 3 sec;

        -- Reset while running
        reset <= '1';
        wait for 1 sec;
        reset <= '0';

        wait;
    end process;
end Behavioral;
