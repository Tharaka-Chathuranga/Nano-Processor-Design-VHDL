----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/16/2023 04:05:33 PM
-- Design Name: 
-- Module Name: Instruction_Decoder - Behavioral
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

entity Instruction_Decoder is
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
end Instruction_Decoder;

architecture Behavioral of Instruction_Decoder is


begin
Reg_Sel_1 <= Ins(6 downto 4);
Reg_Sel_2 <= Ins(9 downto 7);
Add_Or_Sub <= NOT(Ins(11)) AND Ins(10);
Load_Sel <= Ins(11) AND NOT(Ins(10));
Im <= Ins(3 downto 0);
J_Flag <= Ins(10) AND Ins(11);
Reg_En <= Ins(9 downto 7 );
J_Adrs <= Ins( 2 downto 0);


--process(Ins)begin
    
----    Reg_En <= Regen;
----    Reg_Sel_1 <= Reg_Sel1;
----    Reg_Sel_2 <= Reg_Sel2;
----    Add_Or_Sub <= AddOrSub;
----    Im <= Im_Val;
----    Load_Sel <= LoadSel;
----    J_Flag <= Jflag;--when i==1 jump 
----    J_Adrs <= Jadrs;
--    AddOrSub <= NOT(Ins(11)) AND Ins(10);
--    Reg_Sel1 <= Ins(6 downto 4);
--    Reg_Sel2 <= Ins(9 downto 7);
--    Jflag <= Ins(10) AND Ins(11);
--    Im_Val <= Ins(3 downto 0);
--    Regen <= Ins(9 downto 7 );
--    LoadSel <= '0';
--    opcode <= Ins(11 downto 10);
--    Jadrs <= Ins( 2 downto 0);
--    case opcode is
        
--        when "00" => --Add
--            Add_Or_Sub <= NOT(Ins(11)) AND Ins(10);
--            Reg_Sel_1 <= Reg_Sel1;
--            Reg_Sel_2 <= Reg_Sel2;
--            Reg_En <= Regen;
--            LoadSel <= '1';
--            J_Flag <= Jflag;
            
--        when "01" => -- NEg R
--            Add_Or_Sub <= AddOrSub;
--            Reg_Sel_1 <= Reg_Sel1;
--            Reg_Sel_2 <= Reg_Sel2;
--            Reg_En <= Regen;
--            LoadSel <= '1';
--            J_Flag <= Jflag;
            
--        when "10" => --Mov
--            J_Flag <= Ins(10) AND Ins(11);
--            Im <= Im_Val;
--            Reg_En <= Regen;
--            LoadSel <= '0';
            
            
--        when "11" => --Jump
--            Reg_Sel_1 <= Reg_Sel1;
--            J_Flag <= Jflag;
--            J_Adrs <= Jadrs;
            
--        when others =>
--         null;
--    end case;

--end process;
end Behavioral;
