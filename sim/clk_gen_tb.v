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

`define half_period 10.417
`define full_period 20.834

module clk_gen_tb();

reg  tb_clk;
reg  tb_rst;
reg  tb_en;

reg         tb_we_o;
reg  [7:0]  tb_dat_o;
reg  [5:2]  tb_adr_o;
reg         tb_stb_o;
wire [7:0]  tb_dat_i;

clk_gen clk_geni(
    .clk_i(tb_clk),
    .rst_i(tb_rst),
    .ack_o(tb_ack_i),
    .dat_i(tb_dat_o),
    .adr_i(tb_adr_o),
    .dat_o(tb_dat_i),
    .stb_i(tb_stb_o),
    .we_i(tb_we_o),
    .clk_posedge(gen_clk_posedge),
    .clk_out(gen_clk));


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

`define TB_READ_STATUS  2'd0
`define TB_WRITE_STATUS  2'd1
`define TB_READ_DIV      2'd2
`define TB_WRITE_DIV    2'd3

reg [1:0] tb_state;
reg [3:0] tb_cnt;

always  @ (posedge tb_clk or posedge tb_rst)
begin
  if(tb_rst)
  begin
    tb_dat_o <= 8'h00;
    tb_en <= 1'b0;
    tb_we_o <= 1'b0;
    tb_state <= `TB_WRITE_STATUS;
    tb_cnt <= 4'd0;
    tb_adr_o <= `CLK_GEN_STATUS;
  end
  else
  begin
    tb_stb_o <= 1'b0;
    tb_dat_o <= tb_dat_o;
    tb_cnt <= tb_cnt + 1;

    case(tb_state)
      `TB_WRITE_STATUS:
      begin
        tb_we_o <= 1'b1;
        tb_adr_o <= `CLK_GEN_STATUS;

        if(tb_cnt == 4'hf)
        begin
          tb_stb_o <= 1'b1;
          tb_state <= `TB_READ_STATUS;
        end
      end

      `TB_READ_STATUS:
      begin
        tb_we_o <= 1'b0;
        tb_adr_o <= `CLK_GEN_STATUS;

        case(tb_cnt)
          4'hd:
            tb_stb_o <= 1'b1; // Get the current value
          4'hf:
          begin
            tb_dat_o[0] <= ~tb_dat_i[0]; // Flip the value

            if(tb_dat_i[0])
              tb_state <= `TB_WRITE_DIV;
            else
              tb_state <= `TB_WRITE_STATUS; // Write it back

            if(tb_dat_i != tb_dat_o)
              $display("tb_dat_i = %h, tb_dat_o = %h", tb_dat_i, tb_dat_o);
          end
        endcase
      end

      `TB_WRITE_DIV:
      begin
        tb_we_o <= 1'b1;
        tb_adr_o <= `CLK_GEN_DIV;

        if(tb_cnt == 4'hf)
        begin
          tb_stb_o <= 1'b1;
          tb_state <= `TB_READ_DIV;
        end
      end

      `TB_READ_DIV:
      begin
        tb_we_o <= 1'b0;
        tb_adr_o <= `CLK_GEN_DIV;

        case(tb_cnt)
          4'hd:
            tb_stb_o <= 1'b1; // Get the current value
          4'hf:
          begin
            tb_dat_o <= tb_dat_o + 1; // Increment
            if(tb_dat_o == 8'hff)
              tb_state <= `TB_WRITE_STATUS;
            else
              tb_state <= `TB_WRITE_DIV;

            if(tb_dat_i != tb_dat_o)
              $display("tb_dat_i = %h, tb_dat_o = %h", tb_dat_i, tb_dat_o);
          end
        endcase
      end

    endcase
  end
end

endmodule
