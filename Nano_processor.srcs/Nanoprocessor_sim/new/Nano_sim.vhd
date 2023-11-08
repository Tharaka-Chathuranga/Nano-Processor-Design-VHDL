library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Nanoprocessor_Sim is

end Nanoprocessor_Sim;

architecture Behavioral of Nanoprocessor_Sim is
component Nanoprocessor
    Port ( Clk : in STD_LOGIC;
           Res : in STD_LOGIC;
           Zero : out STD_LOGIC;
           Overflow : out STD_LOGIC;
           R7_out : out STD_LOGIC_VECTOR (3 downto 0);
           
           --7Seg Display
           S_7seg : out STD_LOGIC_VECTOR (6 downto 0);
           Anode : out STD_LOGIC_VECTOR (3 downto 0)           
           );
end component;

signal clk : STD_LOGIC:='0';
signal res,zero,overflow : STD_LOGIC;
signal r_out, anode : std_logic_vector (3 downto 0);
signal S : std_logic_vector (6 downto 0);

begin
UUT : Nanoprocessor
    PORT MAP(
    Clk => clk,
    Res => res,
    Zero => zero,
    Overflow => overflow,
    R7_out => R_out,
    S_7seg => S,
    Anode => anode
    );

process
begin
    wait for 1ns;
    Clk <= NOT(Clk);
    wait for 1ns;
end process;

process
begin
    res <= '1';
    wait for 40ns;
    
    res <= '0';
    wait ;
end process;

end Behavioral;
