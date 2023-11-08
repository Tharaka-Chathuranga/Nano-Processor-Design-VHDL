----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/16/2023 11:47:23 AM
-- Design Name: 
-- Module Name: PC_3_bit - Behavioral
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

entity PC_3_bit is
    Port ( Clk : in STD_LOGIC;
           Res : in STD_LOGIC;
           D : in STD_LOGIC_VECTOR (2 downto 0);
           Q : out STD_LOGIC_VECTOR (2 downto 0));
end PC_3_bit;

architecture Behavioral of PC_3_bit is
component D_FF
    Port ( D : in STD_LOGIC;
           Res : in STD_LOGIC;
           Clk : in STD_LOGIC;
           Q : out STD_LOGIC;
           Qbar : out STD_LOGIC);
end component;


signal Q_s: STD_LOGIC_VECTOR( 2 downto 0);
begin

D_FF_0: D_FF
    PORT MAP(
        D => D(0),
        Res => Res,
        Clk => Clk,
        Q => Q_s(0)
    );
    
D_FF_1: D_FF
        PORT MAP(
            D => D(1),
            Res => Res,
            Clk =>Clk,
            Q => Q_s(1)
        );
        
D_FF_2: D_FF
        PORT MAP(
            D => D(2),
            Res => Res,
            Clk => Clk,
            Q => Q_s(2)
        );
          
    
Q <= Q_s;

end Behavioral;
