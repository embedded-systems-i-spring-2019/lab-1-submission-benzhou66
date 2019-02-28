


library IEEE;
use IEEE.STD_LOGIC_1164.ALL; use IEEE.numeric_std.all;

entity REG is

       Port(
       Q:out std_logic;
       C:in std_Logic
       );
       end REG;
       architecture My_REG of REG is
       signal div_out,clk_sig : std_logic;
       signal reg_out : std_logic:='0';
       component clock_div
         port(clk:in std_logic;
              led0:out std_logic);
       end component;
   begin
        divider : clock_div
        port map (
        clk=>C,
        led0=>div_out);
        process(C)
        begin
         if (C'event and C='1') then
           if (div_out='1') then
           reg_out<=(not reg_out);
           end if;
         end if;    
       end process;
       Q<=reg_out;
end My_REG;

