
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity counter_top is
    Port ( btn : in STD_LOGIC_VECTOR (3 downto 0);
           clk : in STD_LOGIC;
           sw : in STD_LOGIC_VECTOR (3 downto 0);
           led0 : out STD_LOGIC_VECTOR (3 downto 0));
end counter_top;

architecture Behavioral of counter_top is
component clock_div
    port(
    led0:out std_logic;
    CLK :in std_logic
    );
    end component;
component debounce
    port(btn : in STD_LOGIC;
           clk : in STD_LOGIC;
           dbnc : out STD_LOGIC
    );
end component;
component fancy_counter
    port(clk : in STD_LOGIC;
           clk_en : in STD_LOGIC;
           dir : in STD_LOGIC;
           en : in STD_LOGIC;
           ld : in STD_LOGIC;
           rst : in STD_LOGIC;
           updn : in STD_LOGIC;
           val : in STD_LOGIC_VECTOR (3 downto 0);
           cnt : out STD_LOGIC_VECTOR (3 downto 0)
    
    );
end component;

signal clk_sig,dbn1,dbn2,dbn3,dbn4,btn1,btn2,btn3,btn4,div_o :std_logic;
signal sw_o, cnt_o : std_logic_vector(3 downto 0);



begin
btn1<=btn(0);
btn2<=btn(1);
btn3<=btn(2);
btn4<=btn(3);
clk_sig<=clk;
sw_o<=sw;
led0<=cnt_o;

dbounce1 : debounce
    port map(
    btn=>btn1,
    clk=>clk_sig,
    dbnc=>dbn1
    ); 
dbounce2 : debounce
    port map(
    btn=>btn2,
    clk=>clk_sig,
    dbnc=>dbn2
    );
dbounce3 : debounce
        port map(
        btn=>btn3,
        clk=>clk_sig,
        dbnc=>dbn3
        );
dbounce4 : debounce
         port map(
         btn=>btn4,
         clk=>clk_sig,
         dbnc=>dbn4
        );
clk_divc : clock_div
     port map(
     clk=>clk_sig,
     led0=>div_o
     );
     
fc_cnt : fancy_counter
    port map(
    clk=>clk_sig,
    clk_en=>div_o,
    dir=>sw(0),
    en=>dbn2,
    ld=>dbn4,
    rst=>dbn1,
    updn=>dbn3,
    val=>sw,
    cnt=>cnt_o
    );


end Behavioral;
