----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/13/2023 01:48:05 PM
-- Design Name: 
-- Module Name: Multiplexer_8_to_1 - Behavioral
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

entity Multiplexer_8_to_1 is
    Port ( S : in STD_LOGIC_VECTOR (2 downto 0);
           D : in STD_LOGIC_VECTOR (7 downto 0);
           EN : in STD_LOGIC;
           Y : out STD_LOGIC);
end Multiplexer_8_to_1;

architecture Behavioral of Multiplexer_8_to_1 is
component Decoder_3_to_8
    Port ( I : in STD_LOGIC_VECTOR (2 downto 0);
           Y : out STD_LOGIC_VECTOR (7 downto 0));
end component;
signal I: STD_LOGIC_VECTOR (7 downto 0);

begin

Decoder_3_to_8_0 : Decoder_3_to_8
    PORT MAP(
        I => S,
        Y => I
    );
Y <= EN AND ((D(0)  AND I(0)) OR (D(1)  AND I(1)) OR (D(2)  AND I(2)) OR (D(3) AND I(3)) OR (D(4) AND I(4)) OR (D(5) AND I(5)) OR (D(6) AND I(6)) OR (D(7) AND I(7)));

end Behavioral;
