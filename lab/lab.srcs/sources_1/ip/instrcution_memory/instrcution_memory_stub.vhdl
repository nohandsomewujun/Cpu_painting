-- Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2019.1 (win64) Build 2552052 Fri May 24 14:49:42 MDT 2019
-- Date        : Sat May 14 22:48:01 2022
-- Host        : DESKTOP-LEJH40V running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode synth_stub
--               F:/jisuanjizuchengyuanli/vivado2.2/lab6/Cpu_painting/lab/lab.srcs/sources_1/ip/instrcution_memory/instrcution_memory_stub.vhdl
-- Design      : instrcution_memory
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xc7a100ticsg324-1L
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity instrcution_memory is
  Port ( 
    a : in STD_LOGIC_VECTOR ( 7 downto 0 );
    spo : out STD_LOGIC_VECTOR ( 31 downto 0 )
  );

end instrcution_memory;

architecture stub of instrcution_memory is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "a[7:0],spo[31:0]";
attribute x_core_info : string;
attribute x_core_info of stub : architecture is "dist_mem_gen_v8_0_13,Vivado 2019.1";
begin
end;
