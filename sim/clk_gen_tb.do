# Delete the work library
vdel -all work
vlib work

# Compile Sources
vlog ../hdl/clk_gen.v

# Compile Testbench
vlog clk_gen_tb.v

vsim -gui work.clk_gen_tb

onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -divider Global
add wave -noupdate -label CLK -radix binary /clk_gen_tb/tb_clk
add wave -noupdate -label RST -radix binary /clk_gen_tb/tb_rst
add wave -noupdate -label tb_state -radix binary /clk_gen_tb/tb_state
add wave -noupdate -divider {WB (Master)}
add wave -noupdate -label TB_ADR_O -radix hexadecimal /clk_gen_tb/tb_adr_o
add wave -noupdate -label TB_DAT_I -radix hexadecimal /clk_gen_tb/tb_dat_i
add wave -noupdate -label TB_DAT_O -radix hexadecimal /clk_gen_tb/tb_dat_o
add wave -noupdate -label TB_WE_O -radix binary /clk_gen_tb/tb_we_o
add wave -noupdate -label TB_STB_O -radix binary /clk_gen_tb/tb_stb_o
add wave -noupdate -label TB_ACK_I -radix binary /clk_gen_tb/tb_ack_i
add wave -noupdate -divider {WB (Slave)}
add wave -noupdate -label TB_CNT -radix hexadecimal /clk_gen_tb/tb_cnt
add wave -noupdate -label ADR_I -radix hexadecimal /clk_gen_tb/clk_geni/adr_i
add wave -noupdate -label DAT_I -radix hexadecimal /clk_gen_tb/clk_geni/dat_i
add wave -noupdate -label DAT_O -radix hexadecimal /clk_gen_tb/clk_geni/dat_o
add wave -noupdate -label WE_I -radix binary /clk_gen_tb/clk_geni/we_i
add wave -noupdate -label STB_I -radix binary /clk_gen_tb/clk_geni/stb_i
add wave -noupdate -label ACK_O -radix binary /clk_gen_tb/clk_geni/ack_o
add wave -noupdate -divider Outputs
add wave -noupdate -label clk_out -radix binary /clk_gen_tb/clk_geni/clk_out
add wave -noupdate -label clk_posedge -radix binary /clk_gen_tb/clk_geni/clk_posedge
add wave -noupdate -label div -radix hexadecimal /clk_gen_tb/clk_geni/div
add wave -noupdate -label div_clk -radix binary /clk_gen_tb/clk_geni/div_clk
add wave -noupdate -label en -radix binary /clk_gen_tb/clk_geni/en
add wave -noupdate -label periods -radix hexadecimal /clk_gen_tb/clk_geni/periods
TreeUpdate [SetDefaultTree]
