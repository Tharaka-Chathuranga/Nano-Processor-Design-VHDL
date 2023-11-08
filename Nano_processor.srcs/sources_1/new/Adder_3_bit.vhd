----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/16/2023 10:53:11 AM
-- Design Name: 
-- Module Name: Adder_3_bit - Behavioral
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

entity Adder_3_bit is
    Port ( X : in STD_LOGIC_VECTOR (2 downto 0);
           Y : in STD_LOGIC:='1';
           S : out STD_LOGIC_VECTOR (2 downto 0));
end Adder_3_bit;

architecture Behavioral of Adder_3_bit is
component FA
    Port ( A : in STD_LOGIC;
           B : in STD_LOGIC;
           C_in : in STD_LOGIC;
           S : out STD_LOGIC;
           C_out : out STD_LOGIC);
end component;
signal C1,C2,C3  : STD_LOGIC;
begin 
FA0 : FA
    PORT MAP(
        A => X(0),
        B => Y,
        C_in =>'0',
        C_out=> C1,
        S => S(0)
    );
        
FA1 : FA
    PORT MAP(
        A => X(1),
        B => '0',
        C_in => C1,
        C_out=> C2,
        S => S(1)
    );
 FA2 : FA
     PORT MAP(
        A => X(2),
        B =>'0',
        C_in => C2,
        C_out=> C3,
        S => S(2)
        );

end Behavioral;
