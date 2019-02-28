


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity fancy_counter is
    Port ( clk : in STD_LOGIC;
           clk_en : in STD_LOGIC;
           dir : in STD_LOGIC;
           en : in STD_LOGIC;
           ld : in STD_LOGIC;
           rst : in STD_LOGIC;
           updn : in STD_LOGIC;
           val : in STD_LOGIC_VECTOR (3 downto 0);
           cnt : out STD_LOGIC_VECTOR (3 downto 0));
end fancy_counter;

architecture Behavioral of fancy_counter is
signal counter : unsigned (3 downto 0);
signal dir_sig : std_logic:='0';
begin

process (clk)
begin
if (en='1') then
  if (clk_en='1') then
    if(rising_edge(clk)) then
        if (updn='1') then
        dir_sig<=dir;
        end if;
            if (dir_sig='1') then
                --if(unsigned(counter)=15)then
                    --counter<=(others=>'0');
              --end if;
            counter <= counter+1;
                --if(unsigned(counter)=15)then
                   -- counter<=(others=>'0');
              --  end if;
            else
            counter <=  counter- 1;
            end if;
          if (ld='1') then
              counter<=unsigned(val); 
          end if;
            if (rst='1') then
              counter<="0000";       
          end if;
    end if;
    end if;
    
end if;
end process;
cnt<=std_logic_vector(counter);
end Behavioral;
