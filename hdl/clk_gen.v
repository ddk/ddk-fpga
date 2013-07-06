/*
 * Copyright (c) 2013, The DDK Project
 *    Dmitry Nedospasov <dmitry at nedos dot net>
 *    Thorsten Schroeder <ths at modzero dot ch>
 *
 * All rights reserved.
 *
 * This file is part of Die Datenkrake (DDK).
 *
 * "THE BEER-WARE LICENSE" (Revision 42):
 * <dmitry at nedos dot net> and <ths at modzero dot ch> wrote this file. As
 * long as you retain this notice you can do whatever you want with this stuff.
 * If we meet some day, and you think this stuff is worth it, you can buy us a
 * beer in return. Die Datenkrake Project.
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
 * Module: clk_gen
 * Description: This module generates a clock of clk/2(div + 1)
 *
 */

`include "../hdl/reg_defs.v"

// We will use Wishbone nomencalture in thsi file
module  clk_gen(
    input wire        clk_i,
    input wire        rst_i,
    output reg        ack_o,
    input wire [7:0]  dat_i,
    input wire [3:0]  adr_i,
    output reg [7:0]  dat_o,
    input wire        stb_i,
    input wire        we_i,
    output wire       clk_posedge,
    output wire       clk_out);

// clk_gen signals
reg          en;
reg          div_clk;
reg [7:0]    div;
reg [7:0]    periods;

assign clk_out = div_clk && en;
assign clk_posedge = (periods == 8'd0) && div_clk && en;

always @ (posedge clk_i)
begin
  if(rst_i)
  begin
    div <= 8'd0;
    en <= 1'b0;
    div_clk <= 1'b0;
    periods <= 8'd0;
    dat_o <= 8'd0;
  end
  else
  begin
    // Default Assignments
    en <= en;
    div <= div;
    periods <= (periods + 1);
    div_clk <= div_clk;
    ack_o <= 1'b0;
    dat_o <= 8'd0;

    if(periods == div)
    begin
      periods <= 8'd0;
      div_clk <= ~div_clk;
    end

    // WBL Slave
    if(stb_i)
    begin
      case(adr_i)
        `CLK_GEN_STATUS:
        begin
          if(we_i) // Write
          begin
            en <= dat_i[0];
            ack_o <= 1'b1;
          end
          else // Read
          begin
            dat_o[0] <= en;
            ack_o <= 1'b1;
          end
        end

        `CLK_GEN_DIV:
        begin
          if(we_i) // Write
          begin
            div <= dat_i;
            periods <= 8'd0;
            ack_o <= 1'b1;
          end
          else // Read
          begin
            dat_o <= div;
            ack_o <= 1'b1;
          end
        end
      endcase
    end
  end
end

endmodule
