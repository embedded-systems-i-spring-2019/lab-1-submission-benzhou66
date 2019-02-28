----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/14/2019 08:18:44 PM
-- Design Name: 
-- Module Name: clock_div - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL; use IEEE.numeric_std.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity clock_div is
--  Port ( );
Port(
led0:out std_logic;
CLK :in std_Logic
);
end clock_div;

architecture My_clock_div of clock_div is

signal counter : std_logic_vector(26 downto 0):=(others=>'0');
begin   
    process(CLK)
    --variable Origin_Hz: integer :=125000000;
    --variable tmp: integer;
    begin
        if (rising_edge(CLK)) then
         if (unsigned(counter) < 31249999) then
                     counter <= std_logic_vector(unsigned(counter) + 1); 
                     led0 <= '0'; 
              else
                     counter <= (others => '0');
                     led0 <= '1';         
            end if;
         end if;
     end process;
end My_clock_div;






       
       
       

