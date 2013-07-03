/*
 * Copyright (c) 2013, The DDK Project
 *    Dmitry Nedospasov <dmitry at nedos dot net>
 *    Thorsten Schroeder <ths at modzero dot ch>
 *
 * All rights reserved.
 *
 * This file is part of Die Datenkrake (DDK).
 * 
 * Die Datenkrake is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 2 of the License, or
 * (at your option) any later version.

 * Die Datenkrake is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 * 
 * You should have received a copy of the GNU General Public License
 * along with Die Datenkrake.  If not, see <http://www.gnu.org/licenses/>.
 *
 * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
 * AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
 * IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
 * ARE DISCLAIMED. IN NO EVENT SHALL THE DDK PROJECT BE LIABLE FOR ANY DIRECT,
 * INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
 * (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
 * LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
 * ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
 * (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
 * SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 *
 */

`timescale 1 ns/1 ps
`include "../hdl/uart_defs.v"
`include "../hdl/reg_defs.v"

module ddk_tb();

reg  tb_clk;
reg  tb_rst;
reg  tb_en;

reg           tb_dclk;
reg           tb_we_o;
reg    [7:0]  tb_dat_o;
reg    [9:2]  tb_adr_o;

reg [8*5 : 0] uart2_rx_state;
reg [8*5 : 0] uart2_tx_state;

wire    tb_din;
wire    tb_uart_rdy;

wire [15:0] data;

assign data = {tb_adr_o, tb_dat_o};

//CH1
wire  [5:0] ch1_in;
wire  [5:0] ch1_out;
wire  [5:0] ch1_oe;

//CH2
wire  [5:0] ch2_in;
wire  [5:0] ch2_out;
wire  [5:0] ch2_oe;

ddk_core ddk_corei(
    .SysClk(tb_clk),    // System Clock
    .SysRst(tb_rst),    // System Reset
    .TX1(TX1),          // LPC TXD1
    .RX1(RX1),          // LPC RXD1
    .DataClk(tb_dclk),  // LPC TXD3
    .DataWe(tb_we_o),   // LPC RXD3
    .DATA(data),        // Parallel Data
    .CH1_IN(ch1_in),    // CH1 Input
    .CH1_OUT(ch1_out),  // CH1 Output
    .CH1_OE(ch1_oe),    // CH1 Output Enable
    .CH2_IN(ch2_in),    // CH2 Input
    .CH2_OUT(ch2_out),  // CH2 Output
    .CH2_OE(ch2_oe));   // CH2 Output Enable


//CH1
assign ch1_in[0] = ch1_oe[0] ? ch1_out[0] : 1'bz;
assign ch1_in[1] = ch1_oe[1] ? ch1_out[1] : 1'bz;
assign ch1_in[2] = ch1_oe[2] ? ch1_out[2] : 1'bz;
assign ch1_in[3] = ch1_oe[3] ? ch1_out[3] : 1'bz;
assign ch1_in[4] = ch1_oe[4] ? ch1_out[4] : 1'bz;
assign ch1_in[5] = ch1_oe[5] ? ch1_out[5] : 1'bz;

//CH2
assign ch2_in[0] = ch2_oe[0] ? ch2_out[0] : 1'bz;
assign ch2_in[1] = ch2_oe[1] ? ch2_out[1] : 1'bz;
assign ch2_in[2] = ch2_oe[2] ? ch2_out[2] : 1'bz;
assign ch2_in[3] = ch2_oe[3] ? ch2_out[3] : 1'bz;
assign ch2_in[4] = ch2_oe[4] ? ch2_out[4] : 1'bz;
assign ch2_in[5] = ch2_oe[5] ? ch2_out[5] : 1'bz;

initial
begin
  tb_clk <= 1'b0;
  tb_rst <= 1'b0;
  #5 tb_rst <= 1'b1;
  #20 tb_rst <= 1'b0;
end

// Generate clock (50MHz)
always
begin
  #10 tb_clk <= ~tb_clk;
end

reg [3:0] tb_cnt;
reg [3:0] acc_cnt;
reg  [2:0]  tb_state;

`define ENABLE_CLOCKS  2'd0
`define ENABLE_PORTS  2'd1

always  @ (posedge tb_clk or posedge tb_rst)
begin
  if(tb_rst)
  begin
    tb_dat_o <= 8'h00;
    tb_en <= 1'b0;
    tb_we_o <= 1'b0;
    tb_cnt <= 4'd0;
    acc_cnt <= 4'd0;
    tb_state <= `ENABLE_CLOCKS;
    tb_dclk <= 1'b0;
  end
  else
  begin
    tb_dat_o <= tb_dat_o;
    tb_adr_o <= tb_adr_o;
    tb_we_o <= tb_we_o;
    tb_dclk <= tb_dclk;
    acc_cnt <= acc_cnt;
    tb_state <= tb_state;

    tb_cnt <= tb_cnt + 1;


    case(tb_state)
      `ENABLE_CLOCKS:
      begin
        tb_adr_o <= {1'b1, acc_cnt[2:0], `CLK_GEN_STATUS};
        case(tb_cnt)
          4'h0:
          begin
            tb_dat_o <= 8'd1;
            tb_we_o <= 1'b1; // Write
            tb_dclk <= ~tb_dclk;
          end

          4'hc:
          begin
            tb_we_o <= 1'b0; // Read
            tb_dclk <= ~tb_dclk;
          end

          4'hf:
          begin
            if(!ddk_corei.ack_i || ddk_corei.dat_i != tb_dat_o)
              $display("ack_i = %d, tb_dat_i = %h, tb_dat_o = %h", ddk_corei.ack_i, ddk_corei.dat_i, tb_dat_o);

            acc_cnt <= acc_cnt + 1; // Increment

            if(acc_cnt == 4'h3) //TODO: CLKD_BASE
            begin
                acc_cnt <= 4'd0;
                tb_state <= `ENABLE_PORTS;
            end
          end
        endcase

      end

      `ENABLE_PORTS:
      begin
        tb_adr_o <= {1'b0, acc_cnt[2:0], `PORT_CONF};
        case(tb_cnt)
          4'h0:
          begin
            tb_dat_o <= 8'b00111111;
            tb_we_o <= 1'b1; // Write
            tb_dclk <= ~tb_dclk;
          end

          4'hc:
          begin
            tb_we_o <= 1'b0; // Read
            tb_dclk <= ~tb_dclk;
          end

          4'hf:
          begin
            if(!ddk_corei.ack_i || ddk_corei.dat_i != tb_dat_o)
              $display("ack_i = %d, tb_dat_i = %h, tb_dat_o = %h", ddk_corei.ack_i, ddk_corei.dat_i, tb_dat_o);

            acc_cnt <= acc_cnt + 1; // Increment

            if(acc_cnt == `CH2_BASE)
            begin
                acc_cnt <= 4'd0;
                $stop;
            end
          end
        endcase

      end

    endcase
  end
end

// Create human-readable labels for current state
// always @ (ddk_corei.uart2_tx.state)
// begin
//   case (ddk_corei.uart2_tx.state)
//     `UART_START:  uart2_tx_state = "Start";
//     `UART_DATA:    uart2_tx_state = "Data";
//     `UART_STOP:    uart2_tx_state = "Stop";
//     `UART_IDLE:    uart2_tx_state = "Idle";
//     default:       uart2_tx_state = "??";
//   endcase
// end

endmodule
