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

entity TB_Adder_3_bit is

end TB_Adder_3_bit;

architecture Behavioral of TB_adder_3_bit is

component Adder_3_bit
    Port ( X : in STD_LOGIC_VECTOR (2 downto 0);
           Y : in STD_LOGIC;
           S : out STD_LOGIC_VECTOR (2 downto 0));
end component;

signal X,S : STD_LOGIC_VECTOR( 2 DOWNTO 0);


begin
UUT: Adder_3_bit
    PORT MAP(
        X => X,
        y => '1',
        S => S
    );
    
 process
 begin 
    X <= "000";
    wait for 20ns;
 
    X <= S;
    wait for 20ns;
    
    X <= S;
    wait for 20ns;
    
    X <= S;
    wait for 20ns;
    
    X <= S;
    wait for 20ns;
    
    X <= S;
    wait for 20ns;
    
    X <= S;
    wait for 20ns;
 end process;
end Behavioral;