----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07/07/2022 05:53:22 PM
-- Design Name: 
-- Module Name: ROM - Behavioral
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
use ieee.numeric_std.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity ROM is
  Port (
    PC : in STD_LOGIC_VECTOR (2 downto 0);
    Ins : out STD_LOGIC_VECTOR (11 downto 0)
   );
end ROM;

architecture Behavioral of ROM is

type rom_type is array (0 to 7) of std_logic_vector(11 downto 0);

signal ROM : rom_type := (  
        "101110000000",    --MOVI R7,0  ;      
        "100010001010",    --MOVI R1, 10 ; 
        "100100000001",    --MOVI R2, 1 ;
        "010100000000",    --NEG R2 ; 
        "000010100000",    --ADD R1, R2 ;
        "000010100000",    --ADD R1, R2 ;
        "110010000111",    --JZR R1, 7 ;
        "001110010000"      --ADD R1,R7     
 
         );
 
begin

    Ins <= ROM(to_integer(unsigned(PC)));

end Behavioral;