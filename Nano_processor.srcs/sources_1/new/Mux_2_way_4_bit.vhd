----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/16/2023 03:29:23 PM
-- Design Name: 
-- Module Name: Mux_2_way_4_bit - Behavioral
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

entity Mux_2_way_4_bit is
    Port ( I : in STD_LOGIC;
           X1 : in STD_LOGIC_VECTOR (3 downto 0);
           X2 : in STD_LOGIC_VECTOR (3 downto 0);
           Y : out STD_LOGIC_VECTOR (3 downto 0));
end Mux_2_way_4_bit;

architecture Behavioral of Mux_2_way_4_bit is

begin
Y(0) <= (X1(0) AND NOT(I)) OR (X2(0) AND I);
Y(1) <= (X1(1) AND NOT(I)) OR (X2(1) AND I);
Y(2) <= (X1(2) AND NOT(I)) OR (X2(2) AND I);
Y(3) <= (X1(3) AND NOT(I)) OR (X2(3) AND I);
end Behavioral;
