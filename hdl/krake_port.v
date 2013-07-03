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
 * Module: krake_port
 * Description: Basic Krake I/O Port
 */

`include "../hdl/reg_defs.v"

module  krake_port(
    input wire        clk_i,
    input wire        rst_i,
    output reg        ack_o,
    input wire [7:0]  dat_i,
    input wire [3:0]  adr_i,
    output reg [7:0]  dat_o,
    input wire        stb_i,
    input wire        we_i,
    input wire [5:0]  ch_in,
    output reg [5:0]  ch_out,
    output reg [5:0]  ch_oe,
    input wire        clka,
    input wire        clkb,
    input wire        clkc,
    input wire        clkd);

reg [4:0] clk_conf [5:0];
reg [5:0] ch_data;
integer i;

always @ (posedge clk_i)
begin
  if(rst_i)
  begin
    ch_data <= 6'd0;
    ch_oe <= 6'd0;
    for(i = 0; i < 6; i = i + 1)
    begin
      clk_conf[i] <= 5'd0;
    end
  end
  else
  begin
    // Default Assignments
    ack_o <= 1'b0;
    dat_o <= 8'd0;
    ch_oe <= ch_oe;

    if(stb_i)
    begin
      case(adr_i)

        `PORT_STATUS:
        begin
          if(we_i) // Write
          begin
            ch_data <= dat_i[5:0];
            ack_o <= 1'b1;
          end
          else // Read
          begin
            dat_o[5:0] <= ch_in;
            ack_o <= 1'b1;
          end
        end

        `PORT_CONF:
        begin
          if(we_i) // Write
          begin
            ch_oe <= dat_i[5:0];
            ack_o <= 1'b1;
          end
          else // Read
          begin
            dat_o[5:0] <= ch_oe;
            ack_o <= 1'b1;
          end
        end

        `PORT_PIN0_CONF:
        begin
          if(we_i) // Write
          begin
            clk_conf[0] <= dat_i[4:0];
            ack_o <= 1'b1;
          end
          else // Read
          begin
            dat_o[4:0] <= clk_conf[0];
            ack_o <= 1'b1;
          end
        end

        `PORT_PIN1_CONF:
        begin
          if(we_i) // Write
          begin
            clk_conf[1] <= dat_i[4:0];
            ack_o <= 1'b1;
          end
          else // Read
          begin
            dat_o[4:0] <= clk_conf[1];
            ack_o <= 1'b1;
          end
        end

        `PORT_PIN2_CONF:
        begin
          if(we_i) // Write
          begin
            clk_conf[2] <= dat_i[4:0];
            ack_o <= 1'b1;
          end
          else // Read
          begin
            dat_o[4:0] <= clk_conf[2];
            ack_o <= 1'b1;
          end
        end

        `PORT_PIN3_CONF:
        begin
          if(we_i) // Write
          begin
            clk_conf[3] <= dat_i[4:0];
            ack_o <= 1'b1;
          end
          else // Read
          begin
            dat_o[4:0] <= clk_conf[3];
            ack_o <= 1'b1;
          end
        end

        `PORT_PIN4_CONF:
        begin
          if(we_i) // Write
          begin
            clk_conf[4] <= dat_i[4:0];
            ack_o <= 1'b1;
          end
          else // Read
          begin
            dat_o[4:0] <= clk_conf[4];
            ack_o <= 1'b1;
          end
        end

        `PORT_PIN5_CONF:
        begin
          if(we_i) // Write
          begin
            clk_conf[5] <= dat_i[4:0];
            ack_o <= 1'b1;
          end
          else // Read
          begin
            dat_o[4:0] <= clk_conf[5];
            ack_o <= 1'b1;
          end
        end

      endcase
    end
  end
end

always @ (ch_data or clk_conf or clk_i or clkd or clkc or clkb or clka)
begin
  ch_out <= ch_data;

  for(i = 0; i < 6; i = i + 1)
  begin
    if(clk_conf[i][4] == 1'b1)
      ch_out[i] <= clk_i;
    else if(clk_conf[i][3] == 1'b1)
      ch_out[i] <= clkd;
    else if(clk_conf[i][2] == 1'b1)
      ch_out[i] <= clkc;
    else if(clk_conf[i][1] == 1'b1)
      ch_out[i] <= clkb;
    else if(clk_conf[i][0] == 1'b1)
      ch_out[i] <= clka;
  end
end

endmodule
