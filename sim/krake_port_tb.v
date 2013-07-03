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
`include "../hdl/reg_defs.v"

module krake_port_tb();

reg tb_clk;
reg tb_rst;
reg tb_en;

reg clka;
reg clkb;
reg clkc;
reg clkd;

reg        tb_we_o;
reg  [7:0] tb_dat_o;
reg  [5:2] tb_adr_o;
reg        tb_stb_o;
wire [7:0] tb_dat_i;

wire  [5:0] ch_in;
wire  [5:0] ch_out;
wire  [5:0] ch_oe;

krake_port krake_porti(
    .clk_i(tb_clk),
    .rst_i(tb_rst),
    .ack_o(tb_ack_i),
    .dat_i(tb_dat_o),
    .adr_i(tb_adr_o),
    .dat_o(tb_dat_i),
    .stb_i(tb_stb_o),
    .we_i(tb_we_o),
    .ch_in(ch_in),
    .ch_out(ch_out),
    .ch_oe(ch_oe),
    .clka(clka),
    .clkb(clkb),
    .clkc(clkc),
    .clkd(clkd));

assign ch_in[0] = ch_oe[0] ? ch_out[0] : 1'bz;
assign ch_in[1] = ch_oe[1] ? ch_out[1] : 1'bz;
assign ch_in[2] = ch_oe[2] ? ch_out[2] : 1'bz;
assign ch_in[3] = ch_oe[3] ? ch_out[3] : 1'bz;
assign ch_in[4] = ch_oe[4] ? ch_out[4] : 1'bz;
assign ch_in[5] = ch_oe[5] ? ch_out[5] : 1'bz;

//end
initial
begin
  tb_clk <= 1'b0;
  tb_rst <= 1'b0;
  clka <= 1'b0;
  clkb <= 1'b0;
  clkc <= 1'b0;
  clkd <= 1'b0;
  #5 tb_rst <= 1'b1;
  #20 tb_rst <= 1'b0;
end

// Generate clock (25MHz)
always
begin
  #20 clka <= ~clka;
end

// Generate clock (12.5MHz)
always
begin
  #40 clkb <= ~clkb;
end

// Generate clock (6.25MHz)
always
begin
  #80 clkc <= ~clkc;
end

// Generate clock (3.125MHz)
always
begin
  #160 clkd <= ~clkd;
end

always
begin
  #10 tb_clk <= ~tb_clk;
end

`define TB_READ    1'd0
`define TB_WRITE  1'd1

reg [1:0] tb_state;
reg [3:0] tb_cnt;

always  @ (posedge tb_clk or posedge tb_rst)
begin
  if(tb_rst)
  begin
    tb_dat_o <= 8'h00;
    tb_en <= 1'b0;
    tb_we_o <= 1'b0;
    tb_state <= `TB_WRITE;
    tb_cnt <= 4'd0;
    tb_adr_o <= 4'd0;
  end
  else
  begin
    tb_stb_o <= 1'b0;
    tb_dat_o <= tb_dat_o;
    tb_adr_o <= tb_adr_o;
    tb_cnt <= tb_cnt + 1;

    case(tb_state)
      `TB_WRITE:
      begin
        tb_we_o <= 1'b1;

        if(tb_cnt == 4'hf)
        begin
          tb_stb_o <= 1'b1;
          tb_state <= `TB_READ;
        end
      end

      `TB_READ:
      begin
        tb_we_o <= 1'b0;

        case(tb_cnt)
          4'hd:
            tb_stb_o <= 1'b1; // Get the current value
          4'hf:
          begin
            tb_dat_o <= tb_dat_o + 1; // Increment
            tb_state <= `TB_WRITE;

            if(tb_adr_o >= `PORT_PIN0_CONF)
            begin
              if(tb_dat_o == 8'h1f)
              begin
                tb_adr_o <= tb_adr_o + 1;
                tb_dat_o <= 8'd0;

                if(tb_adr_o == `PORT_PIN5_CONF)
                  $stop;
              end
            end
            else
            begin
              if(tb_dat_o == 8'h3f)
              begin
                tb_dat_o <= 8'd0;
                tb_adr_o <= tb_adr_o + 1;
              end
            end
          end
        endcase
      end

    endcase
  end
end

endmodule
