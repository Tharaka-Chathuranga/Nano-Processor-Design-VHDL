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

entity Mux_8_way_4_bit is
    Port ( Reg_Sel : in STD_LOGIC_VECTOR (2 downto 0);
           D0 : in STD_LOGIC_VECTOR (3 downto 0);
           D1 : in STD_LOGIC_VECTOR (3 downto 0);
           D2 : in STD_LOGIC_VECTOR (3 downto 0);
           D3 : in STD_LOGIC_VECTOR (3 downto 0);
           D4 : in STD_LOGIC_VECTOR (3 downto 0);
           D5 : in STD_LOGIC_VECTOR (3 downto 0);
           D6 : in STD_LOGIC_VECTOR (3 downto 0);
           D7 : in STD_LOGIC_VECTOR (3 downto 0);
           Y : out STD_LOGIC_VECTOR (3 downto 0));
end Mux_8_way_4_bit;

architecture Behavioral of Mux_8_way_4_bit is


component Multiplexer_8_to_1
    Port ( S : in STD_LOGIC_VECTOR (2 downto 0);
           D : in STD_LOGIC_VECTOR (7 downto 0);
           EN : in STD_LOGIC;
           Y : out STD_LOGIC);
end component;


begin

Multiplexer_8_to_1_0: Multiplexer_8_to_1
    PORT MAP(
        S => Reg_Sel,
        D(0) =>D0(0),
        D(1) =>D1(0),
        D(2) => D2(0),
        D(3) => D3(0), 
        D(4) => D4(0),
        D(5) => D5(0),
        D(6) => D6(0), 
        D(7) => D7(0),
        En => '1',
        Y =>Y(0)
    );
    
Multiplexer_8_to_1_1: Multiplexer_8_to_1
    PORT MAP(
        S => Reg_Sel,
        D(0) =>D0(1),
        D(1) =>D1(1),
        D(2) => D2(1),
        D(3) => D3(1), 
        D(4) => D4(1),
        D(5) => D5(1),
        D(6) => D6(1), 
        D(7) => D7(1),
        En => '1',
        Y =>Y(1)
    );
        
Multiplexer_8_to_1_2: Multiplexer_8_to_1
    PORT MAP(
        S => Reg_Sel,
        D(0) =>D0(2),
        D(1) =>D1(2),
        D(2) => D2(2),
        D(3) => D3(2), 
        D(4) => D4(2),
        D(5) => D5(2),
        D(6) => D6(2), 
        D(7) => D7(2),
        En => '1',
        Y =>Y(2)
    );
            
Multiplexer_8_to_1_3: Multiplexer_8_to_1
    PORT MAP(
        S => Reg_Sel,
        D(0) =>D0(3),
        D(1) =>D1(3),
        D(2) => D2(3),
        D(3) => D3(3), 
        D(4) => D4(3),
        D(5) => D5(3),
        D(6) => D6(3), 
        D(7) => D7(3),
        En => '1',
        Y =>Y(3)
    );

end Behavioral;
