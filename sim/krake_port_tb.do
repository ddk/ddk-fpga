# Delete the work library
vdel -all work
vlib work

# Compile Sources
vlog ../hdl/krake_port.v

# Compile Testbench
vlog krake_port_tb.v

vsim -gui work.krake_port_tb

onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -divider Global
add wave -noupdate -label CLK -radix binary /krake_port_tb/tb_clk
add wave -noupdate -label RST -radix binary /krake_port_tb/tb_rst
add wave -noupdate -label tb_state -radix binary /krake_port_tb/tb_state
add wave -noupdate -label clka -radix binary /krake_port_tb/clka
add wave -noupdate -label clkb -radix binary /krake_port_tb/clkb
add wave -noupdate -label clkc -radix binary /krake_port_tb/clkc
add wave -noupdate -label clkd -radix binary /krake_port_tb/clkd
add wave -noupdate -divider {WB (Master)}
add wave -noupdate -label TB_ADR_O -radix hexadecimal /krake_port_tb/tb_adr_o
add wave -noupdate -label TB_DAT_I -radix hexadecimal /krake_port_tb/tb_dat_i
add wave -noupdate -label TB_DAT_O -radix hexadecimal /krake_port_tb/tb_dat_o
add wave -noupdate -label TB_WE_O -radix binary /krake_port_tb/tb_we_o
add wave -noupdate -label TB_STB_O -radix binary /krake_port_tb/tb_stb_o
add wave -noupdate -label TB_ACK_I -radix binary /krake_port_tb/tb_ack_i
add wave -noupdate -divider {WB (Slave)}
add wave -noupdate -label TB_CNT -radix hexadecimal /krake_port_tb/tb_cnt
add wave -noupdate -label ADR_I -radix hexadecimal /krake_port_tb/krake_porti/adr_i
add wave -noupdate -label DAT_I -radix hexadecimal /krake_port_tb/krake_porti/dat_i
add wave -noupdate -label DAT_O -radix hexadecimal /krake_port_tb/krake_porti/dat_o
add wave -noupdate -label WE_I -radix binary /krake_port_tb/krake_porti/we_i
add wave -noupdate -label STB_I -radix binary /krake_port_tb/krake_porti/stb_i
add wave -noupdate -label ACK_O -radix binary /krake_port_tb/krake_porti/ack_o
add wave -noupdate -divider Outputs
add wave -noupdate -label ch_in -radix binary /krake_port_tb/krake_porti/ch_in
add wave -noupdate -label ch_out -radix binary /krake_port_tb/krake_porti/ch_out
add wave -noupdate -label ch_oe -radix binary /krake_port_tb/krake_porti/ch_oe
TreeUpdate [SetDefaultTree]
