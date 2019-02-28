library ieee;
    use ieee.std_logic_1164.all;
    use ieee.numeric_std.all;

entity debounce_tb1 is
end debounce_tb1;

architecture testbench of debounce_tb1 is

    signal tb_clk : std_logic := '0';
   
    signal tb_O : std_logic;
    
    component Debounce is
        port(
            dbnc:out std_logic;
            btn,clk :in std_Logic      
        );
    end component;

begin

--------------------------------------------------------------------------------
-- procs
--------------------------------------------------------------------------------

    -- simulate a 125 Mhz clock
    clk_gen_proc: process
    begin
    
        wait for 4 ns;
        tb_clk <= '1';
        
        wait for 4 ns;
        tb_clk <= '0';
    
    end process;
    dut : debounce
    port map (
        clk  => tb_clk,
        btn=>'1',
        dbnc=>tb_O
    );
end testbench; 