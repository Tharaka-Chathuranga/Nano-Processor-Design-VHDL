----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/11/2023 02:39:18 PM
-- Design Name: 
-- Module Name: HA - Behavioral
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
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity TB_Nano_processor is

end TB_Nano_processor;

architecture Behavioral of TB_Nano_processor is

component Nanoprocessor
    Port ( Clk : in STD_LOGIC;
           Res : in STD_LOGIC;
           Zero : out STD_LOGIC;
           Overflow : out STD_LOGIC);
end component;

signal clk,res,zero,overflow : STD_LOGIC;


begin
UUT : Nanoprocessor
    PORT MAP(
        Clk => clk,
        Res => res,
        Zero => zero,
        Overflow => overflow
);
process
begin
    wait for 5ns;
    Clk <= NOT(Clk);
end process;

process
begin
    res <= '1';
    wait for 100ns;
    
    res <= '0';
    wait;
end process;


end Behavioral;