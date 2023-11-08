----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/16/2023 05:39:45 PM
-- Design Name: 
-- Module Name: Add_Sub_Unit - Behavioral
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

entity Add_Sub_Unit is
    Port ( CTR : in STD_LOGIC;
           X : in STD_LOGIC_VECTOR (3 downto 0);
           Y : in STD_LOGIC_VECTOR (3 downto 0);
           Overflow : out STD_LOGIC;
           Zero : out STD_LOGIC;
           S : out STD_LOGIC_VECTOR (3 downto 0));
end Add_Sub_Unit;

architecture Behavioral of Add_Sub_Unit is
component FA
    Port ( A : in STD_LOGIC;
           B : in STD_LOGIC;
           C_in : in STD_LOGIC;
           S : out STD_LOGIC;
           C_out : out STD_LOGIC);
end component;

signal As_0,As_1,As_2,As_3 : STD_LOGIC;
signal S_sig : STD_LOGIC_VECTOR (3 downto 0);
signal C1,C2,C3,C4 : STD_LOGIC;

begin
    FA0 : FA
        PORT MAP(
            A => X(0),
            B => As_0,
            C_in => CTR,
            C_out=> C1,
            S => S_sig(0)
        );
        
    FA1 : FA
        PORT MAP(
            A => X(1),
            B => As_1,
            C_in => C1,
            C_out=> C2,
            S => S_sig(1)
        );
     FA2 : FA
        PORT MAP(
             A => X(2),
             B => As_2,
             C_in => C2,
             C_out=> C3,
             S => S_sig(2)
         );
    FA3 : FA
        PORT MAP(
            A => X(3),
            B => As_3,
            C_in => C3,
            C_out=> C4,
            S => S_sig(3)
        );
             

As_0 <= CTR XOR Y(0);
As_1 <= CTR XOR Y(1);
As_2 <= CTR XOR Y(2);
As_3 <= CTR XOR Y(3);
S <= S_sig;
Zero <= NOT(S_sig(0)) AND NOT(S_sig(1))AND NOT(S_sig(2))AND NOT(S_sig(3));
Overflow <=  C4;
end Behavioral;
