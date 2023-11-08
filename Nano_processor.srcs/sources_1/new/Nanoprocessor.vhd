----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/16/2023 06:42:51 PM
-- Design Name: 
-- Module Name: Nanoprocessor - Behavioral
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

entity Nanoprocessor is
    Port ( Clk : in STD_LOGIC;
           Res : in STD_LOGIC;
           Zero : out STD_LOGIC;
           Overflow : out STD_LOGIC;
           R7_out : out STD_LOGIC_VECTOR (3 downto 0);
           
           --7Seg Display
           S_7seg : out STD_LOGIC_VECTOR (6 downto 0);
           Anode : out STD_LOGIC_VECTOR (3 downto 0));           
end Nanoprocessor;

architecture Behavioral of Nanoprocessor is
component Add_Sub_Unit
    Port ( CTR : in STD_LOGIC;
           X : in STD_LOGIC_VECTOR (3 downto 0);
           Y : in STD_LOGIC_VECTOR (3 downto 0);
           Overflow : out STD_LOGIC;
           Zero : out STD_LOGIC;
           S : out STD_LOGIC_VECTOR (3 downto 0));
end component;

component Register_Bank
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

end component;

component Mux_8_way_4_bit
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
end component;

component Mux_2_way_4_bit
    Port ( I : in STD_LOGIC;
           X1 : in STD_LOGIC_VECTOR (3 downto 0);
           X2 : in STD_LOGIC_VECTOR (3 downto 0);
           Y : out STD_LOGIC_VECTOR (3 downto 0));
end component;

component Slow_Clk
    Port ( Clk_in : in STD_LOGIC;
           Clk_out : out STD_LOGIC);
end component;

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

component Adder_3_bit
    Port ( X : in STD_LOGIC_VECTOR (2 downto 0);
           Y : in STD_LOGIC:='1';
           S : out STD_LOGIC_VECTOR (2 downto 0));
end component;

component Mux_2_way_3_bit
    Port ( I : in STD_LOGIC;
           X1 : in STD_LOGIC_VECTOR (2 downto 0);
           X2 : in STD_LOGIC_VECTOR (2 downto 0);
           Y : out STD_LOGIC_VECTOR (2 downto 0));    
end component;

component PC_3_bit
    Port ( Clk : in STD_LOGIC;
           Res : in STD_LOGIC;
           D : in STD_LOGIC_VECTOR (2 downto 0);
           Q : out STD_LOGIC_VECTOR (2 downto 0));
end component;

component ROM
    Port (
            PC : in STD_LOGIC_VECTOR (2 downto 0);
            Ins : out STD_LOGIC_VECTOR (11 downto 0)
    );
end component;

component LUT_16_7
    Port ( 
        address : in STD_LOGIC_VECTOR (3 downto 0);
        data : out STD_LOGIC_VECTOR (6 downto 0));
        
end component;


signal DB0,DB1,DB2,DB3,DB4,DB5,DB6,DB7,Mux_8_1,Mux_8_2,AS,R_Val,Imm,Reg_Check_J : STD_LOGIC_VECTOR (3 downto 0);
signal overflow_AS,zero_AS,S_clk : STD_LOGIC;
signal Reg_En,Reg_Sel_1,Reg_Sel_2,PC,N_PC,Ad_PC,J_Adrs : STD_LOGIC_VECTOR (2 downto 0);
signal Load_Sel,Add_Or_Sub,J_Flag : STD_LOGIC;
signal Ins,I :STD_LOGIC_VECTOR (11 downto 0);
begin

Register_Bank_0 : Register_Bank
    PORT MAP(
        En => Reg_En,
        Clk => S_clk,
        X => R_Val,
        Y0 => DB0,
        Y1 => DB1,
        Y2 => DB2,
        Y3 => DB3,
        Y4 => DB4,
        Y5 => DB5,
        Y6 => DB6,
        Y7 => DB7
    );
    
 Mux_8_way_4_bit_0 : Mux_8_way_4_bit
    PORT MAP(
        Reg_Sel => Reg_Sel_1,
        D0 => DB0,
        D1 => DB1,
        D2 => DB2,
        D3 => DB3,
        D4 => DB4,
        D5 => DB5,
        D6 => DB6,
        D7=> DB7,
        Y => Mux_8_1
    );
    
 Mux_8_way_4_bit_1 : Mux_8_way_4_bit
   PORT MAP(
       Reg_Sel => Reg_Sel_2,
       D0 => DB0,
       D1 => DB1,
       D2 => DB2,
       D3 => DB3,
       D4 => DB4,
       D5 => DB5,
       D6 => DB6,
       D7 => DB7,
       Y => Mux_8_2
   );
   
Add_Sub_Unit_0 : Add_Sub_Unit
    PORT MAP(
        CTR =>Add_Or_sub,
        X => Mux_8_1,
        Y => Mux_8_2,
        Overflow => Overflow,
        Zero =>Zero,
        S => AS
        
    );
    
 Mux_2_way_4_bit_0 : Mux_2_way_4_bit
    PORT MAP(
        I => Load_Sel,
        X1 =>AS,
        X2 => Imm,
        Y => R_Val
    );
    
Adder_3_bit_0 : Adder_3_bit
    PORT MAP(
        X => PC,
        S => Ad_PC
    );
    
Mux_2_way_3_bit_0 : Mux_2_way_3_bit
    PORT MAP(
        I => J_Flag,
        X1 => Ad_PC,
        X2 => J_Adrs,
        Y => N_PC
    );  
    
PC_3_bit_0 : PC_3_bit  
    PORT MAP(
        Clk => S_clk,
        Res => Res,
        D => N_PC,
        Q => PC
        );


ROM_0 :ROM
    PORT MAP(
        PC => PC,
        Ins => Ins
    ); 
    
Instruction_Decoder_0 : Instruction_Decoder
    PORT MAP(
        Ins => Ins,
        Reg_En => Reg_En,
        Reg_Sel_1 => Reg_Sel_1,
        Reg_Sel_2 => Reg_Sel_2,
        Im => Imm,
        Load_Sel => Load_Sel,
        Add_Or_Sub => Add_Or_Sub,
        Reg_Check_J => Mux_8_1,
        J_Flag => J_Flag,
        J_Adrs => J_Adrs   
    );  
 Slow_Clk_0 : Slow_Clk
    PORT MAP(
        Clk_in => Clk,
        Clk_out => S_clk
    )    ;
    
LUT_16_7_0: LUT_16_7
        PORT MAP ( 
            address => DB7,
            data => S_7seg
            );
R7_out <= DB7;
Anode <= "1110";

    

end Behavioral;
