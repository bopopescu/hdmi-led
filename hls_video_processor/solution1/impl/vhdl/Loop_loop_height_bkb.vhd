-- ==============================================================
-- File generated on Thu Apr 25 22:46:36 -0400 2019
-- Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC v2018.3 (64-bit)
-- SW Build 2405991 on Thu Dec  6 23:38:27 MST 2018
-- IP Build 2404404 on Fri Dec  7 01:43:56 MST 2018
-- Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
-- ==============================================================
library ieee; 
use ieee.std_logic_1164.all; 
use ieee.std_logic_unsigned.all;

entity Loop_loop_height_bkb_rom is 
    generic(
             DWIDTH     : integer := 12; 
             AWIDTH     : integer := 8; 
             MEM_SIZE    : integer := 256
    ); 
    port (
          addr0      : in std_logic_vector(AWIDTH-1 downto 0); 
          ce0       : in std_logic; 
          q0         : out std_logic_vector(DWIDTH-1 downto 0);
          addr1      : in std_logic_vector(AWIDTH-1 downto 0); 
          ce1       : in std_logic; 
          q1         : out std_logic_vector(DWIDTH-1 downto 0);
          addr2      : in std_logic_vector(AWIDTH-1 downto 0); 
          ce2       : in std_logic; 
          q2         : out std_logic_vector(DWIDTH-1 downto 0);
          clk       : in std_logic
    ); 
end entity; 


architecture rtl of Loop_loop_height_bkb_rom is 

signal addr0_tmp : std_logic_vector(AWIDTH-1 downto 0); 
signal addr1_tmp : std_logic_vector(AWIDTH-1 downto 0); 
signal addr2_tmp : std_logic_vector(AWIDTH-1 downto 0); 
type mem_array is array (0 to MEM_SIZE-1) of std_logic_vector (DWIDTH-1 downto 0); 
signal mem0 : mem_array := (
    0 => "000000000000", 1 => "000000000001", 2 => "000000000010", 
    3 => "000000000100", 4 => "000000000101", 5 => "000000000110", 
    6 => "000000000111", 7 => "000000001001", 8 => "000000001010", 
    9 => "000000001011", 10 => "000000001100", 11 => "000000001110", 
    12 => "000000001111", 13 => "000000010000", 14 => "000000010010", 
    15 => "000000010011", 16 => "000000010101", 17 => "000000010111", 
    18 => "000000011001", 19 => "000000011011", 20 => "000000011101", 
    21 => "000000011111", 22 => "000000100001", 23 => "000000100011", 
    24 => "000000100101", 25 => "000000101000", 26 => "000000101010", 
    27 => "000000101101", 28 => "000000101111", 29 => "000000110010", 
    30 => "000000110101", 31 => "000000111000", 32 => "000000111011", 
    33 => "000000111110", 34 => "000001000001", 35 => "000001000101", 
    36 => "000001001000", 37 => "000001001011", 38 => "000001001111", 
    39 => "000001010011", 40 => "000001010111", 41 => "000001011010", 
    42 => "000001011110", 43 => "000001100011", 44 => "000001100111", 
    45 => "000001101011", 46 => "000001101111", 47 => "000001110100", 
    48 => "000001111001", 49 => "000001111101", 50 => "000010000010", 
    51 => "000010000111", 52 => "000010001100", 53 => "000010010001", 
    54 => "000010010111", 55 => "000010011100", 56 => "000010100001", 
    57 => "000010100111", 58 => "000010101101", 59 => "000010110010", 
    60 => "000010111000", 61 => "000010111110", 62 => "000011000101", 
    63 => "000011001011", 64 => "000011010001", 65 => "000011011000", 
    66 => "000011011110", 67 => "000011100101", 68 => "000011101100", 
    69 => "000011110011", 70 => "000011111010", 71 => "000100000001", 
    72 => "000100001000", 73 => "000100010000", 74 => "000100010111", 
    75 => "000100011111", 76 => "000100100111", 77 => "000100101111", 
    78 => "000100110111", 79 => "000100111111", 80 => "000101000111", 
    81 => "000101010000", 82 => "000101011000", 83 => "000101100001", 
    84 => "000101101010", 85 => "000101110011", 86 => "000101111100", 
    87 => "000110000101", 88 => "000110001110", 89 => "000110011000", 
    90 => "000110100001", 91 => "000110101011", 92 => "000110110101", 
    93 => "000110111111", 94 => "000111001001", 95 => "000111010011", 
    96 => "000111011101", 97 => "000111101000", 98 => "000111110010", 
    99 => "000111111101", 100 => "001000001000", 101 => "001000010011", 
    102 => "001000011110", 103 => "001000101001", 104 => "001000110101", 
    105 => "001001000000", 106 => "001001001100", 107 => "001001011000", 
    108 => "001001100100", 109 => "001001110000", 110 => "001001111100", 
    111 => "001010001001", 112 => "001010010101", 113 => "001010100010", 
    114 => "001010101111", 115 => "001010111011", 116 => "001011001001", 
    117 => "001011010110", 118 => "001011100011", 119 => "001011110001", 
    120 => "001011111110", 121 => "001100001100", 122 => "001100011010", 
    123 => "001100101000", 124 => "001100110110", 125 => "001101000101", 
    126 => "001101010011", 127 => "001101100010", 128 => "001101110001", 
    129 => "001110000000", 130 => "001110001111", 131 => "001110011110", 
    132 => "001110101101", 133 => "001110111101", 134 => "001111001101", 
    135 => "001111011101", 136 => "001111101101", 137 => "001111111101", 
    138 => "010000001101", 139 => "010000011101", 140 => "010000101110", 
    141 => "010000111111", 142 => "010001010000", 143 => "010001100001", 
    144 => "010001110010", 145 => "010010000011", 146 => "010010010101", 
    147 => "010010100110", 148 => "010010111000", 149 => "010011001010", 
    150 => "010011011100", 151 => "010011101111", 152 => "010100000001", 
    153 => "010100010100", 154 => "010100100110", 155 => "010100111001", 
    156 => "010101001100", 157 => "010101100000", 158 => "010101110011", 
    159 => "010110000111", 160 => "010110011010", 161 => "010110101110", 
    162 => "010111000010", 163 => "010111010110", 164 => "010111101011", 
    165 => "010111111111", 166 => "011000010100", 167 => "011000101001", 
    168 => "011000111110", 169 => "011001010011", 170 => "011001101000", 
    171 => "011001111110", 172 => "011010010011", 173 => "011010101001", 
    174 => "011010111111", 175 => "011011010101", 176 => "011011101011", 
    177 => "011100000010", 178 => "011100011000", 179 => "011100101111", 
    180 => "011101000110", 181 => "011101011101", 182 => "011101110101", 
    183 => "011110001100", 184 => "011110100100", 185 => "011110111011", 
    186 => "011111010011", 187 => "011111101011", 188 => "100000000100", 
    189 => "100000011100", 190 => "100000110101", 191 => "100001001110", 
    192 => "100001100111", 193 => "100010000000", 194 => "100010011001", 
    195 => "100010110011", 196 => "100011001100", 197 => "100011100110", 
    198 => "100100000000", 199 => "100100011010", 200 => "100100110101", 
    201 => "100101001111", 202 => "100101101010", 203 => "100110000101", 
    204 => "100110100000", 205 => "100110111011", 206 => "100111010110", 
    207 => "100111110010", 208 => "101000001101", 209 => "101000101001", 
    210 => "101001000101", 211 => "101001100010", 212 => "101001111110", 
    213 => "101010011011", 214 => "101010111000", 215 => "101011010101", 
    216 => "101011110010", 217 => "101100001111", 218 => "101100101100", 
    219 => "101101001010", 220 => "101101101000", 221 => "101110000110", 
    222 => "101110100100", 223 => "101111000011", 224 => "101111100001", 
    225 => "110000000000", 226 => "110000011111", 227 => "110000111110", 
    228 => "110001011101", 229 => "110001111101", 230 => "110010011100", 
    231 => "110010111100", 232 => "110011011100", 233 => "110011111101", 
    234 => "110100011101", 235 => "110100111110", 236 => "110101011110", 
    237 => "110101111111", 238 => "110110100000", 239 => "110111000010", 
    240 => "110111100011", 241 => "111000000101", 242 => "111000100111", 
    243 => "111001001001", 244 => "111001101011", 245 => "111010001101", 
    246 => "111010110000", 247 => "111011010011", 248 => "111011110110", 
    249 => "111100011001", 250 => "111100111100", 251 => "111101100000", 
    252 => "111110000100", 253 => "111110101000", 254 => "111111001100", 
    255 => "111111110000" );
signal mem1 : mem_array := (
    0 => "000000000000", 1 => "000000000001", 2 => "000000000010", 
    3 => "000000000100", 4 => "000000000101", 5 => "000000000110", 
    6 => "000000000111", 7 => "000000001001", 8 => "000000001010", 
    9 => "000000001011", 10 => "000000001100", 11 => "000000001110", 
    12 => "000000001111", 13 => "000000010000", 14 => "000000010010", 
    15 => "000000010011", 16 => "000000010101", 17 => "000000010111", 
    18 => "000000011001", 19 => "000000011011", 20 => "000000011101", 
    21 => "000000011111", 22 => "000000100001", 23 => "000000100011", 
    24 => "000000100101", 25 => "000000101000", 26 => "000000101010", 
    27 => "000000101101", 28 => "000000101111", 29 => "000000110010", 
    30 => "000000110101", 31 => "000000111000", 32 => "000000111011", 
    33 => "000000111110", 34 => "000001000001", 35 => "000001000101", 
    36 => "000001001000", 37 => "000001001011", 38 => "000001001111", 
    39 => "000001010011", 40 => "000001010111", 41 => "000001011010", 
    42 => "000001011110", 43 => "000001100011", 44 => "000001100111", 
    45 => "000001101011", 46 => "000001101111", 47 => "000001110100", 
    48 => "000001111001", 49 => "000001111101", 50 => "000010000010", 
    51 => "000010000111", 52 => "000010001100", 53 => "000010010001", 
    54 => "000010010111", 55 => "000010011100", 56 => "000010100001", 
    57 => "000010100111", 58 => "000010101101", 59 => "000010110010", 
    60 => "000010111000", 61 => "000010111110", 62 => "000011000101", 
    63 => "000011001011", 64 => "000011010001", 65 => "000011011000", 
    66 => "000011011110", 67 => "000011100101", 68 => "000011101100", 
    69 => "000011110011", 70 => "000011111010", 71 => "000100000001", 
    72 => "000100001000", 73 => "000100010000", 74 => "000100010111", 
    75 => "000100011111", 76 => "000100100111", 77 => "000100101111", 
    78 => "000100110111", 79 => "000100111111", 80 => "000101000111", 
    81 => "000101010000", 82 => "000101011000", 83 => "000101100001", 
    84 => "000101101010", 85 => "000101110011", 86 => "000101111100", 
    87 => "000110000101", 88 => "000110001110", 89 => "000110011000", 
    90 => "000110100001", 91 => "000110101011", 92 => "000110110101", 
    93 => "000110111111", 94 => "000111001001", 95 => "000111010011", 
    96 => "000111011101", 97 => "000111101000", 98 => "000111110010", 
    99 => "000111111101", 100 => "001000001000", 101 => "001000010011", 
    102 => "001000011110", 103 => "001000101001", 104 => "001000110101", 
    105 => "001001000000", 106 => "001001001100", 107 => "001001011000", 
    108 => "001001100100", 109 => "001001110000", 110 => "001001111100", 
    111 => "001010001001", 112 => "001010010101", 113 => "001010100010", 
    114 => "001010101111", 115 => "001010111011", 116 => "001011001001", 
    117 => "001011010110", 118 => "001011100011", 119 => "001011110001", 
    120 => "001011111110", 121 => "001100001100", 122 => "001100011010", 
    123 => "001100101000", 124 => "001100110110", 125 => "001101000101", 
    126 => "001101010011", 127 => "001101100010", 128 => "001101110001", 
    129 => "001110000000", 130 => "001110001111", 131 => "001110011110", 
    132 => "001110101101", 133 => "001110111101", 134 => "001111001101", 
    135 => "001111011101", 136 => "001111101101", 137 => "001111111101", 
    138 => "010000001101", 139 => "010000011101", 140 => "010000101110", 
    141 => "010000111111", 142 => "010001010000", 143 => "010001100001", 
    144 => "010001110010", 145 => "010010000011", 146 => "010010010101", 
    147 => "010010100110", 148 => "010010111000", 149 => "010011001010", 
    150 => "010011011100", 151 => "010011101111", 152 => "010100000001", 
    153 => "010100010100", 154 => "010100100110", 155 => "010100111001", 
    156 => "010101001100", 157 => "010101100000", 158 => "010101110011", 
    159 => "010110000111", 160 => "010110011010", 161 => "010110101110", 
    162 => "010111000010", 163 => "010111010110", 164 => "010111101011", 
    165 => "010111111111", 166 => "011000010100", 167 => "011000101001", 
    168 => "011000111110", 169 => "011001010011", 170 => "011001101000", 
    171 => "011001111110", 172 => "011010010011", 173 => "011010101001", 
    174 => "011010111111", 175 => "011011010101", 176 => "011011101011", 
    177 => "011100000010", 178 => "011100011000", 179 => "011100101111", 
    180 => "011101000110", 181 => "011101011101", 182 => "011101110101", 
    183 => "011110001100", 184 => "011110100100", 185 => "011110111011", 
    186 => "011111010011", 187 => "011111101011", 188 => "100000000100", 
    189 => "100000011100", 190 => "100000110101", 191 => "100001001110", 
    192 => "100001100111", 193 => "100010000000", 194 => "100010011001", 
    195 => "100010110011", 196 => "100011001100", 197 => "100011100110", 
    198 => "100100000000", 199 => "100100011010", 200 => "100100110101", 
    201 => "100101001111", 202 => "100101101010", 203 => "100110000101", 
    204 => "100110100000", 205 => "100110111011", 206 => "100111010110", 
    207 => "100111110010", 208 => "101000001101", 209 => "101000101001", 
    210 => "101001000101", 211 => "101001100010", 212 => "101001111110", 
    213 => "101010011011", 214 => "101010111000", 215 => "101011010101", 
    216 => "101011110010", 217 => "101100001111", 218 => "101100101100", 
    219 => "101101001010", 220 => "101101101000", 221 => "101110000110", 
    222 => "101110100100", 223 => "101111000011", 224 => "101111100001", 
    225 => "110000000000", 226 => "110000011111", 227 => "110000111110", 
    228 => "110001011101", 229 => "110001111101", 230 => "110010011100", 
    231 => "110010111100", 232 => "110011011100", 233 => "110011111101", 
    234 => "110100011101", 235 => "110100111110", 236 => "110101011110", 
    237 => "110101111111", 238 => "110110100000", 239 => "110111000010", 
    240 => "110111100011", 241 => "111000000101", 242 => "111000100111", 
    243 => "111001001001", 244 => "111001101011", 245 => "111010001101", 
    246 => "111010110000", 247 => "111011010011", 248 => "111011110110", 
    249 => "111100011001", 250 => "111100111100", 251 => "111101100000", 
    252 => "111110000100", 253 => "111110101000", 254 => "111111001100", 
    255 => "111111110000" );

attribute syn_rom_style : string;
attribute syn_rom_style of mem0 : signal is "block_rom";
attribute syn_rom_style of mem1 : signal is "block_rom";
attribute ROM_STYLE : string;
attribute ROM_STYLE of mem0 : signal is "block";
attribute ROM_STYLE of mem1 : signal is "block";

begin 


memory_access_guard_0: process (addr0) 
begin
      addr0_tmp <= addr0;
--synthesis translate_off
      if (CONV_INTEGER(addr0) > mem_size-1) then
           addr0_tmp <= (others => '0');
      else 
           addr0_tmp <= addr0;
      end if;
--synthesis translate_on
end process;

memory_access_guard_1: process (addr1) 
begin
      addr1_tmp <= addr1;
--synthesis translate_off
      if (CONV_INTEGER(addr1) > mem_size-1) then
           addr1_tmp <= (others => '0');
      else 
           addr1_tmp <= addr1;
      end if;
--synthesis translate_on
end process;

memory_access_guard_2: process (addr2) 
begin
      addr2_tmp <= addr2;
--synthesis translate_off
      if (CONV_INTEGER(addr2) > mem_size-1) then
           addr2_tmp <= (others => '0');
      else 
           addr2_tmp <= addr2;
      end if;
--synthesis translate_on
end process;

p_rom_access: process (clk)  
begin 
    if (clk'event and clk = '1') then
        if (ce0 = '1') then 
            q0 <= mem0(CONV_INTEGER(addr0_tmp)); 
        end if;
        if (ce1 = '1') then 
            q1 <= mem0(CONV_INTEGER(addr1_tmp)); 
        end if;
        if (ce2 = '1') then 
            q2 <= mem1(CONV_INTEGER(addr2_tmp)); 
        end if;
    end if;
end process;

end rtl;

Library IEEE;
use IEEE.std_logic_1164.all;

entity Loop_loop_height_bkb is
    generic (
        DataWidth : INTEGER := 12;
        AddressRange : INTEGER := 256;
        AddressWidth : INTEGER := 8);
    port (
        reset : IN STD_LOGIC;
        clk : IN STD_LOGIC;
        address0 : IN STD_LOGIC_VECTOR(AddressWidth - 1 DOWNTO 0);
        ce0 : IN STD_LOGIC;
        q0 : OUT STD_LOGIC_VECTOR(DataWidth - 1 DOWNTO 0);
        address1 : IN STD_LOGIC_VECTOR(AddressWidth - 1 DOWNTO 0);
        ce1 : IN STD_LOGIC;
        q1 : OUT STD_LOGIC_VECTOR(DataWidth - 1 DOWNTO 0);
        address2 : IN STD_LOGIC_VECTOR(AddressWidth - 1 DOWNTO 0);
        ce2 : IN STD_LOGIC;
        q2 : OUT STD_LOGIC_VECTOR(DataWidth - 1 DOWNTO 0));
end entity;

architecture arch of Loop_loop_height_bkb is
    component Loop_loop_height_bkb_rom is
        port (
            clk : IN STD_LOGIC;
            addr0 : IN STD_LOGIC_VECTOR;
            ce0 : IN STD_LOGIC;
            q0 : OUT STD_LOGIC_VECTOR;
            addr1 : IN STD_LOGIC_VECTOR;
            ce1 : IN STD_LOGIC;
            q1 : OUT STD_LOGIC_VECTOR;
            addr2 : IN STD_LOGIC_VECTOR;
            ce2 : IN STD_LOGIC;
            q2 : OUT STD_LOGIC_VECTOR);
    end component;



begin
    Loop_loop_height_bkb_rom_U :  component Loop_loop_height_bkb_rom
    port map (
        clk => clk,
        addr0 => address0,
        ce0 => ce0,
        q0 => q0,
        addr1 => address1,
        ce1 => ce1,
        q1 => q1,
        addr2 => address2,
        ce2 => ce2,
        q2 => q2);

end architecture;

