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

entity Instruction_Decoder_Sim is

end Instruction_Decoder_Sim;

architecture Behavioral of Instruction_Decoder_Sim is

component Instruction_Decoder
    Port ( Ins : in STD_LOGIC_VECTOR (11 downto 0);
           Reg_En : out STD_LOGIC_VECTOR (2 downto 0);
           Reg_Sel_1 : out STD_LOGIC_VECTOR (2 downto 0);
           Reg_Sel_2 : out STD_LOGIC_VECTOR (2 downto 0);
           Im : out STD_LOGIC_VECTOR (3 downto 0);
           Load_Sel : out STD_LOGIC;
           Add_Or_Sub : out STD_LOGIC;
           Reg_Check_J : in STD_LOGIC_VECTOR (3 downto 0);
           J_Flag : out STD_LOGIC;
           J_Adrs : out STD_LOGIC_VECTOR (2 downto 0));
end component;

signal J_Flag,Load_Sel,Add_Or_Sub : STD_LOGIC;
signal J_Adrs,Reg_Sel_1,Reg_Sel_2,Reg_En :STD_LOGIC_VECTOR (2 downto 0);
signal Instruc : STD_LOGIC_VECTOR (11 downto 0);
signal Im,Reg_check_J : STD_LOGIC_VECTOR (3 downto 0);
begin
UUT: Instruction_Decoder
    PORT MAP(
        Ins=> Instruc,
        J_Flag => J_Flag,
        Load_Sel => Load_Sel,
        Add_Or_Sub => Add_Or_sub,
        J_Adrs => J_Adrs,
        Reg_Check_j => Reg_Check_J,
        Reg_Sel_1 => Reg_Sel_1,
        Reg_Sel_2 => Reg_Sel_2,
        Reg_En => Reg_En,
        Im => Im
    );
    
 process
 begin 
    Instruc <= "100010001110";
    wait for 10ns;
 end process;
end Behavioral;