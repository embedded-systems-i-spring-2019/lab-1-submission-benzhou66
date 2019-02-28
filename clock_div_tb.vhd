--
-- filename:    blinker_tb.vhd
-- written by:  steve dinicolantonio
-- description: testbench for blinker.vhd
-- notes:       
--
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------

library ieee;
    use ieee.std_logic_1164.all;
    use ieee.numeric_std.all;

entity clock_div_tb1 is
end clock_div_tb1;

architecture testbench of clock_div_tb1 is

    signal tb_clk : std_logic := '0';
   
    signal tb_O : std_logic;
    
    component REG is
        port(
            Q:out std_logic;
            C :in std_Logic      
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
    dut : REG
    port map (
        C  => tb_clk,
        Q => tb_O
    );
end testbench; 