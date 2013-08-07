onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -radix binary /read_fifo_tb/tb_clk
add wave -noupdate -radix binary /read_fifo_tb/tb_rst
add wave -noupdate -radix binary /read_fifo_tb/tb_en
add wave -noupdate -radix binary /read_fifo_tb/tb_we_o
add wave -noupdate -radix hexadecimal /read_fifo_tb/tb_adr_o
add wave -noupdate -radix binary /read_fifo_tb/tb_stb_o
add wave -noupdate -radix hexadecimal /read_fifo_tb/tb_dat_i
add wave -noupdate -radix binary /read_fifo_tb/tb_ack_i
add wave -noupdate -radix binary /read_fifo_tb/tb_timeout
add wave -noupdate -radix unsigned /read_fifo_tb/tb_timeout_cnt
add wave -noupdate -radix binary /read_fifo_tb/tb_ack
add wave -noupdate -radix binary /read_fifo_tb/tb_adr
add wave -noupdate -radix binary /read_fifo_tb/tb_dat
add wave -noupdate -radix binary /read_fifo_tb/rdfifoi/clk_i
add wave -noupdate -radix binary /read_fifo_tb/rdfifoi/rst_i
add wave -noupdate -radix binary /read_fifo_tb/rdfifoi/ack_i
add wave -noupdate -radix binary /read_fifo_tb/rdfifoi/dat_i
add wave -noupdate -radix binary /read_fifo_tb/rdfifoi/adr_o
add wave -noupdate -radix binary /read_fifo_tb/rdfifoi/stb_o
add wave -noupdate -radix binary /read_fifo_tb/rdfifoi/we_o
add wave -noupdate -radix binary /read_fifo_tb/rdfifoi/rd_valid
add wave -noupdate -radix binary /read_fifo_tb/rdfifoi/rd_ack
add wave -noupdate -radix binary /read_fifo_tb/rdfifoi/rd_adr
add wave -noupdate -radix binary /read_fifo_tb/rdfifoi/rd_dat
add wave -noupdate -radix binary /read_fifo_tb/rdfifoi/fifo_empty
add wave -noupdate -radix binary /read_fifo_tb/rdfifoi/tx_rdy
add wave -noupdate -radix binary /read_fifo_tb/rdfifoi/tx_data
add wave -noupdate -radix binary /read_fifo_tb/rdfifoi/rdi/clk_i
add wave -noupdate -radix binary /read_fifo_tb/rdfifoi/rdi/rst_i
add wave -noupdate -radix binary /read_fifo_tb/rdfifoi/rdi/ack_i
add wave -noupdate -radix binary /read_fifo_tb/rdfifoi/rdi/dat_i
add wave -noupdate -radix binary /read_fifo_tb/rdfifoi/rdi/adr_o
add wave -noupdate -radix binary /read_fifo_tb/rdfifoi/rdi/stb_o
add wave -noupdate -radix binary /read_fifo_tb/rdfifoi/rdi/we_o
add wave -noupdate -radix binary /read_fifo_tb/rdfifoi/rdi/valid
add wave -noupdate -radix binary /read_fifo_tb/rdfifoi/rdi/read_ack
add wave -noupdate -radix hexadecimal /read_fifo_tb/rdfifoi/rdi/read_adr
add wave -noupdate -radix hexadecimal /read_fifo_tb/rdfifoi/rdi/read_dat
add wave -noupdate -radix binary /read_fifo_tb/rdfifoi/rdi/read
add wave -noupdate -radix hexadecimal -childformat {{{/read_fifo_tb/rdfifoi/fifoi/DATA[16]} -radix binary} {{/read_fifo_tb/rdfifoi/fifoi/DATA[15]} -radix binary} {{/read_fifo_tb/rdfifoi/fifoi/DATA[14]} -radix binary} {{/read_fifo_tb/rdfifoi/fifoi/DATA[13]} -radix binary} {{/read_fifo_tb/rdfifoi/fifoi/DATA[12]} -radix binary} {{/read_fifo_tb/rdfifoi/fifoi/DATA[11]} -radix binary} {{/read_fifo_tb/rdfifoi/fifoi/DATA[10]} -radix binary} {{/read_fifo_tb/rdfifoi/fifoi/DATA[9]} -radix binary} {{/read_fifo_tb/rdfifoi/fifoi/DATA[8]} -radix binary} {{/read_fifo_tb/rdfifoi/fifoi/DATA[7]} -radix binary} {{/read_fifo_tb/rdfifoi/fifoi/DATA[6]} -radix binary} {{/read_fifo_tb/rdfifoi/fifoi/DATA[5]} -radix binary} {{/read_fifo_tb/rdfifoi/fifoi/DATA[4]} -radix binary} {{/read_fifo_tb/rdfifoi/fifoi/DATA[3]} -radix binary} {{/read_fifo_tb/rdfifoi/fifoi/DATA[2]} -radix binary} {{/read_fifo_tb/rdfifoi/fifoi/DATA[1]} -radix binary} {{/read_fifo_tb/rdfifoi/fifoi/DATA[0]} -radix binary}} -subitemconfig {{/read_fifo_tb/rdfifoi/fifoi/DATA[16]} {-height 15 -radix binary} {/read_fifo_tb/rdfifoi/fifoi/DATA[15]} {-height 15 -radix binary} {/read_fifo_tb/rdfifoi/fifoi/DATA[14]} {-height 15 -radix binary} {/read_fifo_tb/rdfifoi/fifoi/DATA[13]} {-height 15 -radix binary} {/read_fifo_tb/rdfifoi/fifoi/DATA[12]} {-height 15 -radix binary} {/read_fifo_tb/rdfifoi/fifoi/DATA[11]} {-height 15 -radix binary} {/read_fifo_tb/rdfifoi/fifoi/DATA[10]} {-height 15 -radix binary} {/read_fifo_tb/rdfifoi/fifoi/DATA[9]} {-height 15 -radix binary} {/read_fifo_tb/rdfifoi/fifoi/DATA[8]} {-height 15 -radix binary} {/read_fifo_tb/rdfifoi/fifoi/DATA[7]} {-height 15 -radix binary} {/read_fifo_tb/rdfifoi/fifoi/DATA[6]} {-height 15 -radix binary} {/read_fifo_tb/rdfifoi/fifoi/DATA[5]} {-height 15 -radix binary} {/read_fifo_tb/rdfifoi/fifoi/DATA[4]} {-height 15 -radix binary} {/read_fifo_tb/rdfifoi/fifoi/DATA[3]} {-height 15 -radix binary} {/read_fifo_tb/rdfifoi/fifoi/DATA[2]} {-height 15 -radix binary} {/read_fifo_tb/rdfifoi/fifoi/DATA[1]} {-height 15 -radix binary} {/read_fifo_tb/rdfifoi/fifoi/DATA[0]} {-height 15 -radix binary}} /read_fifo_tb/rdfifoi/fifoi/DATA
add wave -noupdate -radix hexadecimal -childformat {{{/read_fifo_tb/rdfifoi/fifoi/Q[16]} -radix binary} {{/read_fifo_tb/rdfifoi/fifoi/Q[15]} -radix binary} {{/read_fifo_tb/rdfifoi/fifoi/Q[14]} -radix binary} {{/read_fifo_tb/rdfifoi/fifoi/Q[13]} -radix binary} {{/read_fifo_tb/rdfifoi/fifoi/Q[12]} -radix binary} {{/read_fifo_tb/rdfifoi/fifoi/Q[11]} -radix binary} {{/read_fifo_tb/rdfifoi/fifoi/Q[10]} -radix binary} {{/read_fifo_tb/rdfifoi/fifoi/Q[9]} -radix binary} {{/read_fifo_tb/rdfifoi/fifoi/Q[8]} -radix binary} {{/read_fifo_tb/rdfifoi/fifoi/Q[7]} -radix binary} {{/read_fifo_tb/rdfifoi/fifoi/Q[6]} -radix binary} {{/read_fifo_tb/rdfifoi/fifoi/Q[5]} -radix binary} {{/read_fifo_tb/rdfifoi/fifoi/Q[4]} -radix binary} {{/read_fifo_tb/rdfifoi/fifoi/Q[3]} -radix binary} {{/read_fifo_tb/rdfifoi/fifoi/Q[2]} -radix binary} {{/read_fifo_tb/rdfifoi/fifoi/Q[1]} -radix binary} {{/read_fifo_tb/rdfifoi/fifoi/Q[0]} -radix binary}} -subitemconfig {{/read_fifo_tb/rdfifoi/fifoi/Q[16]} {-height 15 -radix binary} {/read_fifo_tb/rdfifoi/fifoi/Q[15]} {-height 15 -radix binary} {/read_fifo_tb/rdfifoi/fifoi/Q[14]} {-height 15 -radix binary} {/read_fifo_tb/rdfifoi/fifoi/Q[13]} {-height 15 -radix binary} {/read_fifo_tb/rdfifoi/fifoi/Q[12]} {-height 15 -radix binary} {/read_fifo_tb/rdfifoi/fifoi/Q[11]} {-height 15 -radix binary} {/read_fifo_tb/rdfifoi/fifoi/Q[10]} {-height 15 -radix binary} {/read_fifo_tb/rdfifoi/fifoi/Q[9]} {-height 15 -radix binary} {/read_fifo_tb/rdfifoi/fifoi/Q[8]} {-height 15 -radix binary} {/read_fifo_tb/rdfifoi/fifoi/Q[7]} {-height 15 -radix binary} {/read_fifo_tb/rdfifoi/fifoi/Q[6]} {-height 15 -radix binary} {/read_fifo_tb/rdfifoi/fifoi/Q[5]} {-height 15 -radix binary} {/read_fifo_tb/rdfifoi/fifoi/Q[4]} {-height 15 -radix binary} {/read_fifo_tb/rdfifoi/fifoi/Q[3]} {-height 15 -radix binary} {/read_fifo_tb/rdfifoi/fifoi/Q[2]} {-height 15 -radix binary} {/read_fifo_tb/rdfifoi/fifoi/Q[1]} {-height 15 -radix binary} {/read_fifo_tb/rdfifoi/fifoi/Q[0]} {-height 15 -radix binary}} /read_fifo_tb/rdfifoi/fifoi/Q
add wave -noupdate -radix binary /read_fifo_tb/rdfifoi/fifoi/WE
add wave -noupdate -radix binary /read_fifo_tb/rdfifoi/fifoi/RE
add wave -noupdate -radix binary /read_fifo_tb/rdfifoi/fifoi/WCLOCK
add wave -noupdate -radix binary /read_fifo_tb/rdfifoi/fifoi/RCLOCK
add wave -noupdate -radix binary /read_fifo_tb/rdfifoi/fifoi/FULL
add wave -noupdate -radix binary /read_fifo_tb/rdfifoi/fifoi/EMPTY
add wave -noupdate -radix binary /read_fifo_tb/rdfifoi/fifoi/RESET
add wave -noupdate -radix binary /read_fifo_tb/rdfifoi/fifoi/AEMPTY
add wave -noupdate -radix binary /read_fifo_tb/rdfifoi/fifoi/AFULL
add wave -noupdate -radix binary /read_fifo_tb/rdfifoi/fifoi/WEBP
add wave -noupdate -radix binary /read_fifo_tb/rdfifoi/fifoi/RESETP
add wave -noupdate -radix binary /read_fifo_tb/rdfifoi/txi/clk
add wave -noupdate -radix binary /read_fifo_tb/rdfifoi/txi/rst
add wave -noupdate -radix binary /read_fifo_tb/rdfifoi/txi/dout
add wave -noupdate -radix hexadecimal -childformat {{{/read_fifo_tb/rdfifoi/txi/data_out[7]} -radix binary} {{/read_fifo_tb/rdfifoi/txi/data_out[6]} -radix binary} {{/read_fifo_tb/rdfifoi/txi/data_out[5]} -radix binary} {{/read_fifo_tb/rdfifoi/txi/data_out[4]} -radix binary} {{/read_fifo_tb/rdfifoi/txi/data_out[3]} -radix binary} {{/read_fifo_tb/rdfifoi/txi/data_out[2]} -radix binary} {{/read_fifo_tb/rdfifoi/txi/data_out[1]} -radix binary} {{/read_fifo_tb/rdfifoi/txi/data_out[0]} -radix binary}} -subitemconfig {{/read_fifo_tb/rdfifoi/txi/data_out[7]} {-height 15 -radix binary} {/read_fifo_tb/rdfifoi/txi/data_out[6]} {-height 15 -radix binary} {/read_fifo_tb/rdfifoi/txi/data_out[5]} {-height 15 -radix binary} {/read_fifo_tb/rdfifoi/txi/data_out[4]} {-height 15 -radix binary} {/read_fifo_tb/rdfifoi/txi/data_out[3]} {-height 15 -radix binary} {/read_fifo_tb/rdfifoi/txi/data_out[2]} {-height 15 -radix binary} {/read_fifo_tb/rdfifoi/txi/data_out[1]} {-height 15 -radix binary} {/read_fifo_tb/rdfifoi/txi/data_out[0]} {-height 15 -radix binary}} /read_fifo_tb/rdfifoi/txi/data_out
add wave -noupdate -radix binary /read_fifo_tb/rdfifoi/txi/en
add wave -noupdate -radix binary /read_fifo_tb/rdfifoi/txi/rdy
add wave -noupdate -radix hexadecimal /read_fifo_tb/rdfifoi/txi/data
add wave -noupdate -radix binary /read_fifo_tb/rdfifoi/txi/state
add wave -noupdate -radix binary /read_fifo_tb/rdfifoi/txi/bit_cnt
add wave -noupdate -radix unsigned /read_fifo_tb/rdfifoi/txi/etu_cnt
add wave -noupdate -radix binary /read_fifo_tb/rdfifoi/txi/etu_full
add wave -noupdate -radix hexadecimal /read_fifo_tb/rdfifoi/ack
add wave -noupdate -radix hexadecimal /read_fifo_tb/rdfifoi/adr
add wave -noupdate -radix hexadecimal /read_fifo_tb/rdfifoi/dat
add wave -noupdate /read_fifo_tb/rdfifoi/state
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {90660000 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 205
configure wave -valuecolwidth 121
configure wave -justifyvalue left
configure wave -signalnamewidth 0
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ns
update
WaveRestoreZoom {0 ps} {1066180608 ps}
