----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/16/2023 01:05:56 PM
-- Design Name: 
-- Module Name: Register_Bank - Behavioral
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

entity Register_Bank is
    Port ( En : in STD_LOGIC_VECTOR (2 downto 0);
           Clk : in STD_LOGIC;
           X :   in STD_LOGIC_VECTOR (3 downto 0);
           Y0 : out STD_LOGIC_VECTOR (3 downto 0);
           Y1 : out STD_LOGIC_VECTOR (3 downto 0);
           Y2 : out STD_LOGIC_VECTOR (3 downto 0);
           Y3 : out STD_LOGIC_VECTOR (3 downto 0);
           Y4 : out STD_LOGIC_VECTOR (3 downto 0);
           Y5 : out STD_LOGIC_VECTOR (3 downto 0);
           Y6 : out STD_LOGIC_VECTOR (3 downto 0);
           Y7 : out STD_LOGIC_VECTOR (3 downto 0));
end Register_Bank;

architecture Behavioral of Register_Bank is

component Reg
    Port ( D : in STD_LOGIC_VECTOR (3 downto 0);
           Clk : in STD_LOGIC;
           En : in STD_LOGIC;
           Q : out STD_LOGIC_VECTOR (3 downto 0));
end  component;

component Decoder_3_to_8
    Port ( I : in STD_LOGIC_VECTOR (2 downto 0);
           Y : out STD_LOGIC_VECTOR (7 downto 0));
end component;

signal Reg_En : STD_LOGIC_VECTOR (7 downto 0);

begin
Decoder_3_to_8_0: Decoder_3_to_8
    PORT MAP(
        I => En,
        Y => Reg_En
    );
    
Reg_0 : Reg
    PORT MAP(
        D => "0000",
        Clk => Clk,
        En => '1',
        Q => Y0
    );
        
 Reg_1 : Reg
    PORT MAP(
        D => X,
        Clk => Clk,
        En => Reg_En(1),
        Q => Y1
    );

Reg_2 : Reg
    PORT MAP(
        D => X,
        Clk => Clk,
        En => Reg_En(2),
        Q => Y2
    );
       
 Reg_3 : Reg
    PORT MAP(
        D => X,
        Clk => Clk,
        En => Reg_En(3),
        Q => Y3
    );
                
Reg_4 : Reg
    PORT MAP(
        D => X,
        Clk => Clk,
        En => Reg_En(4),
        Q => Y4
    );
                        
                        
Reg_5 : Reg
    PORT MAP(
        D => X,
        Clk => Clk,
        En => Reg_En(5),
        Q => Y5
    );
    
 Reg_6 : Reg
    PORT MAP(
        D => X,
        Clk => Clk,
        En => Reg_En(6),
        Q => Y6
    );
    
Reg_7 : Reg
    PORT MAP(
        D => X,
        Clk => Clk,
        En => Reg_En(7),
        Q => Y7
    );                                                                                                                     
end Behavioral;
