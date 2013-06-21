# Delete work library
vdel -all work
vlib work

# Compile Verilog HDL Sources
vlog ../hdl/uart_rx.v
vlog ../hdl/uart_tx.v
vlog ../hdl/clk_gen.v
vlog ../hdl/krake_port.v
vlog ../hdl/krake_bus.v
vlog ../hdl/ddk_core.v

# Compile Test Bench
vlog ddk_tb.v

vsim -gui work.ddk_tb

onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -divider TestBench
add wave -noupdate -label TB_CLK -radix binary /ddk_tb/tb_clk
add wave -noupdate -label TB_DIN -radix binary /ddk_tb/tb_din
add wave -noupdate -label TB_EN -radix binary /ddk_tb/tb_en
add wave -noupdate -label TB_RST -radix binary /ddk_tb/tb_rst
add wave -noupdate -label TB_UART_RDY -radix binary /ddk_tb/tb_uart_rdy
add wave -noupdate -label acc_cnt -radix hexadecimal /ddk_tb/acc_cnt
add wave -noupdate -label tb_cnt -radix hexadecimal /ddk_tb/tb_cnt
add wave -noupdate -label tb_state -radix hexadecimal /ddk_tb/tb_state
TreeUpdate [SetDefaultTree]
quietly WaveActivateNextPane
add wave -noupdate -divider {Krake Bus}
add wave -noupdate -label DATA -radix hexadecimal /ddk_tb/ddk_corei/ext_bus/data
add wave -noupdate -label DATA_CLK -radix binary /ddk_tb/ddk_corei/ext_bus/data_clk
add wave -noupdate -label ACK_I -radix binary /ddk_tb/ddk_corei/ack_i
add wave -noupdate -label ADR_O -radix hexadecimal /ddk_tb/ddk_corei/adr_o
add wave -noupdate -label DAT_I -radix hexadecimal /ddk_tb/ddk_corei/dat_i
add wave -noupdate -label DAT_O -radix hexadecimal /ddk_tb/ddk_corei/dat_o
add wave -noupdate -label STB_O -radix binary /ddk_tb/ddk_corei/stb_o
add wave -noupdate -label WE_O -radix binary /ddk_tb/ddk_corei/we_o
TreeUpdate [SetDefaultTree]
quietly WaveActivateNextPane
add wave -noupdate -divider UART2RX
add wave -noupdate -label DIN -radix binary /ddk_tb/ddk_corei/uart2_rx/din
add wave -noupdate -label DATA_IN -radix hexadecimal /ddk_tb/ddk_corei/uart2_rx/data_in
add wave -noupdate -label VALID -radix binary /ddk_tb/ddk_corei/uart2_rx/valid
add wave -noupdate -label STATE -radix ascii /ddk_tb/uart2_rx_state
add wave -noupdate -divider UART2TX
add wave -noupdate -label DOUT -radix binary /ddk_tb/ddk_corei/uart2_tx/dout
add wave -noupdate -label DATA_OUT -radix hexadecimal /ddk_tb/ddk_corei/uart2_tx/data_out
add wave -noupdate -label EN -radix binary /ddk_tb/ddk_corei/uart2_tx/en
add wave -noupdate -label RDY -radix binary /ddk_tb/ddk_corei/uart2_tx/rdy
TreeUpdate [SetDefaultTree]
quietly WaveActivateNextPane
add wave -noupdate -divider CH1
add wave -noupdate -label ACK_O -radix binary /ddk_tb/ddk_corei/ch1/ack_o
add wave -noupdate -label DAT_I -radix hexadecimal /ddk_tb/ddk_corei/ch1/dat_i
add wave -noupdate -label ADR_I -radix hexadecimal /ddk_tb/ddk_corei/ch1/adr_i
add wave -noupdate -label DAT_O -radix hexadecimal /ddk_tb/ddk_corei/ch1/dat_o
add wave -noupdate -label STB_I -radix binary /ddk_tb/ddk_corei/ch1/stb_i
add wave -noupdate -label WE_I -radix binary /ddk_tb/ddk_corei/ch1/we_i
add wave -noupdate -label ch_in -radix binary /ddk_tb/ddk_corei/ch1/ch_in
add wave -noupdate -label ch_out -radix binary /ddk_tb/ddk_corei/ch1/ch_out
add wave -noupdate -label ch_oe -radix binary /ddk_tb/ddk_corei/ch1/ch_oe
add wave -noupdate -divider CH2
add wave -noupdate -label ACK_O -radix binary /ddk_tb/ddk_corei/ch2/ack_o
add wave -noupdate -label DAT_I -radix hexadecimal /ddk_tb/ddk_corei/ch2/dat_i
add wave -noupdate -label ADR_I -radix hexadecimal /ddk_tb/ddk_corei/ch2/adr_i
add wave -noupdate -label DAT_O -radix hexadecimal /ddk_tb/ddk_corei/ch2/dat_o
add wave -noupdate -label STB_I -radix binary /ddk_tb/ddk_corei/ch2/stb_i
add wave -noupdate -label WE_I -radix binary /ddk_tb/ddk_corei/ch2/we_i
add wave -noupdate -label ch_in -radix binary /ddk_tb/ddk_corei/ch2/ch_in
add wave -noupdate -label ch_out -radix binary /ddk_tb/ddk_corei/ch2/ch_out
add wave -noupdate -label ch_oe -radix binary /ddk_tb/ddk_corei/ch2/ch_oe
add wave -noupdate -divider CLKA
add wave -noupdate -label ACK_O -radix binary /ddk_tb/ddk_corei/clk_gena/ack_o
add wave -noupdate -label DAT_I -radix binary /ddk_tb/ddk_corei/clk_gena/dat_i
add wave -noupdate -label ADR_I -radix binary /ddk_tb/ddk_corei/clk_gena/adr_i
add wave -noupdate -label DAT_O -radix binary /ddk_tb/ddk_corei/clk_gena/dat_o
add wave -noupdate -label STB_I -radix binary /ddk_tb/ddk_corei/clk_gena/stb_i
add wave -noupdate -label WE_I -radix binary /ddk_tb/ddk_corei/clk_gena/we_i
add wave -noupdate -label clk_posedge -radix binary /ddk_tb/ddk_corei/clk_gena/clk_posedge
add wave -noupdate -label clk_out -radix binary /ddk_tb/ddk_corei/clk_gena/clk_out
add wave -noupdate -label div_clk -radix binary /ddk_tb/ddk_corei/clk_gena/div_clk
add wave -noupdate -label en -radix binary /ddk_tb/ddk_corei/clk_gena/en
add wave -noupdate -label div -radix hexadecimal /ddk_tb/ddk_corei/clk_gena/div
add wave -noupdate -label periods -radix hexadecimal /ddk_tb/ddk_corei/clk_gena/periods
add wave -noupdate -divider CLKB
add wave -noupdate -label ACK_O -radix binary /ddk_tb/ddk_corei/clk_genb/ack_o
add wave -noupdate -label DAT_I -radix binary /ddk_tb/ddk_corei/clk_genb/dat_i
add wave -noupdate -label ADR_I -radix binary /ddk_tb/ddk_corei/clk_genb/adr_i
add wave -noupdate -label DAT_O -radix binary /ddk_tb/ddk_corei/clk_genb/dat_o
add wave -noupdate -label STB_I -radix binary /ddk_tb/ddk_corei/clk_genb/stb_i
add wave -noupdate -label WE_I -radix binary /ddk_tb/ddk_corei/clk_genb/we_i
add wave -noupdate -label clk_posedge -radix binary /ddk_tb/ddk_corei/clk_genb/clk_posedge
add wave -noupdate -label clk_out -radix binary /ddk_tb/ddk_corei/clk_genb/clk_out
add wave -noupdate -label div_clk -radix binary /ddk_tb/ddk_corei/clk_genb/div_clk
add wave -noupdate -label en -radix binary /ddk_tb/ddk_corei/clk_genb/en
add wave -noupdate -label div -radix hexadecimal /ddk_tb/ddk_corei/clk_genb/div
add wave -noupdate -label periods -radix hexadecimal /ddk_tb/ddk_corei/clk_genb/periods
add wave -noupdate -divider CLKC
add wave -noupdate -label ACK_O -radix binary /ddk_tb/ddk_corei/clk_genc/ack_o
add wave -noupdate -label DAT_I -radix binary /ddk_tb/ddk_corei/clk_genc/dat_i
add wave -noupdate -label ADR_I -radix binary /ddk_tb/ddk_corei/clk_genc/adr_i
add wave -noupdate -label DAT_O -radix binary /ddk_tb/ddk_corei/clk_genc/dat_o
add wave -noupdate -label STB_I -radix binary /ddk_tb/ddk_corei/clk_genc/stb_i
add wave -noupdate -label WE_I -radix binary /ddk_tb/ddk_corei/clk_genc/we_i
add wave -noupdate -label clk_posedge -radix binary /ddk_tb/ddk_corei/clk_genc/clk_posedge
add wave -noupdate -label clk_out -radix binary /ddk_tb/ddk_corei/clk_genc/clk_out
add wave -noupdate -label div_clk -radix binary /ddk_tb/ddk_corei/clk_genc/div_clk
add wave -noupdate -label en -radix binary /ddk_tb/ddk_corei/clk_genc/en
add wave -noupdate -label div -radix hexadecimal /ddk_tb/ddk_corei/clk_genc/div
add wave -noupdate -label periods -radix hexadecimal /ddk_tb/ddk_corei/clk_genc/periods
add wave -noupdate -divider CLKD
add wave -noupdate -label ACK_O -radix binary /ddk_tb/ddk_corei/clk_gend/ack_o
add wave -noupdate -label DAT_I -radix binary /ddk_tb/ddk_corei/clk_gend/dat_i
add wave -noupdate -label ADR_I -radix binary /ddk_tb/ddk_corei/clk_gend/adr_i
add wave -noupdate -label DAT_O -radix binary /ddk_tb/ddk_corei/clk_gend/dat_o
add wave -noupdate -label STB_I -radix binary /ddk_tb/ddk_corei/clk_gend/stb_i
add wave -noupdate -label WE_I -radix binary /ddk_tb/ddk_corei/clk_gend/we_i
add wave -noupdate -label clk_posedge -radix binary /ddk_tb/ddk_corei/clk_gend/clk_posedge
add wave -noupdate -label clk_out -radix binary /ddk_tb/ddk_corei/clk_gend/clk_out
add wave -noupdate -label div_clk -radix binary /ddk_tb/ddk_corei/clk_gend/div_clk
add wave -noupdate -label en -radix binary /ddk_tb/ddk_corei/clk_gend/en
add wave -noupdate -label div -radix hexadecimal /ddk_tb/ddk_corei/clk_gend/div
add wave -noupdate -label periods -radix hexadecimal /ddk_tb/ddk_corei/clk_gend/periods

TreeUpdate [SetDefaultTree]
