onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -group testbench /testbench/rst
add wave -noupdate -group testbench /testbench/input_data
add wave -noupdate -group testbench /testbench/input_valid
add wave -noupdate -group testbench /testbench/input_ready
add wave -noupdate -group testbench /testbench/output_data
add wave -noupdate -group testbench /testbench/output_valid
add wave -noupdate -group testbench /testbench/output_ready
add wave -noupdate -group skintone_datapath /testbench/i_skintone_datapath/rst
add wave -noupdate -group skintone_datapath /testbench/i_skintone_datapath/clk
add wave -noupdate -group skintone_datapath -divider -height 25 {configuration interface}
add wave -noupdate -group skintone_datapath /testbench/i_skintone_datapath/config_address
add wave -noupdate -group skintone_datapath -radix hexadecimal /testbench/i_skintone_datapath/config_datain
add wave -noupdate -group skintone_datapath /testbench/i_skintone_datapath/config_wrreq
add wave -noupdate -group skintone_datapath /testbench/i_skintone_datapath/config_wrack
add wave -noupdate -group skintone_datapath /testbench/i_skintone_datapath/config_rdreq
add wave -noupdate -group skintone_datapath /testbench/i_skintone_datapath/config_rdack
add wave -noupdate -group skintone_datapath /testbench/i_skintone_datapath/config_dataout
add wave -noupdate -group skintone_datapath -divider <NULL>
add wave -noupdate -group skintone_datapath -divider -height 25 {pixel interface}
add wave -noupdate -group skintone_datapath -radix hexadecimal /testbench/i_skintone_datapath/pixel_datain
add wave -noupdate -group skintone_datapath /testbench/i_skintone_datapath/pixel_datain_valid
add wave -noupdate -group skintone_datapath /testbench/i_skintone_datapath/pixel_datain_ready
add wave -noupdate -group skintone_datapath -divider <NULL>
add wave -noupdate -group skintone_datapath -divider -height 25 {result interface}
add wave -noupdate -group skintone_datapath /testbench/i_skintone_datapath/result_dataout
add wave -noupdate -group skintone_datapath /testbench/i_skintone_datapath/result_dataout_valid
add wave -noupdate -group skintone_datapath /testbench/i_skintone_datapath/result_dataout_ready
add wave -noupdate -group skintone_datapath -divider <NULL>
add wave -noupdate -group skintone_datapath -divider {opcode interface}
add wave -noupdate -group skintone_datapath /testbench/i_skintone_datapath/opcode
add wave -noupdate -group skintone_datapath /testbench/i_skintone_datapath/opcode_valid
add wave -noupdate -group skintone_datapath /testbench/i_skintone_datapath/opcode_accept
add wave -noupdate -group skintone_datapath -divider <NULL>
add wave -noupdate -group skintone_datapath -divider <NULL>
add wave -noupdate -group skintone_datapath /testbench/i_skintone_datapath/status
add wave -noupdate -group skintone_datapath /testbench/i_skintone_datapath/input_fifo_rst
add wave -noupdate -group skintone_datapath /testbench/i_skintone_datapath/input_fifo_wren
add wave -noupdate -group skintone_datapath /testbench/i_skintone_datapath/input_fifo_rden
add wave -noupdate -group skintone_datapath /testbench/i_skintone_datapath/input_fifo_datain
add wave -noupdate -group skintone_datapath /testbench/i_skintone_datapath/input_fifo_dataout
add wave -noupdate -group skintone_datapath /testbench/i_skintone_datapath/input_fifo_empty
add wave -noupdate -group skintone_datapath /testbench/i_skintone_datapath/input_fifo_full
add wave -noupdate -group skintone_datapath /testbench/i_skintone_datapath/input_fifo_prog_full
add wave -noupdate -group skintone_datapath /testbench/i_skintone_datapath/input_fifo_count
add wave -noupdate -group skintone_datapath /testbench/i_skintone_datapath/output_fifo_rst
add wave -noupdate -group skintone_datapath /testbench/i_skintone_datapath/output_fifo_wren
add wave -noupdate -group skintone_datapath /testbench/i_skintone_datapath/output_fifo_rden
add wave -noupdate -group skintone_datapath /testbench/i_skintone_datapath/output_fifo_datain
add wave -noupdate -group skintone_datapath /testbench/i_skintone_datapath/output_fifo_dataout
add wave -noupdate -group skintone_datapath /testbench/i_skintone_datapath/output_fifo_empty
add wave -noupdate -group skintone_datapath /testbench/i_skintone_datapath/output_fifo_full
add wave -noupdate -group skintone_datapath /testbench/i_skintone_datapath/output_fifo_prog_full
add wave -noupdate -group skintone_datapath -radix unsigned /testbench/i_skintone_datapath/output_fifo_count
add wave -noupdate -group skintone_datapath /testbench/i_skintone_datapath/opcode_accept_r
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {6399480 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 317
configure wave -valuecolwidth 40
configure wave -justifyvalue left
configure wave -signalnamewidth 1
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ps
update
WaveRestoreZoom {0 ps} {11595581 ps}
