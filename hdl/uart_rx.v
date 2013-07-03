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
 * Module: 
 * Description: 
 */
`include "../hdl/global_defs.v"
`include "../hdl/uart_defs.v"

module  uart_rx(
          input wire clk,
          input wire rst,
          input wire din,
          output reg [7:0] data_in,
          output reg valid);

reg [1:0]  state;
reg [2:0] bit_cnt;
reg [8:0]  etu_cnt;

wire etu_full, etu_half;
assign etu_full = (etu_cnt == `UART_FULL_ETU);
assign etu_half = (etu_cnt == `UART_HALF_ETU);

always  @ (posedge clk)
begin
  if (rst)
  begin
    state <= `UART_START;
  end

  else
  begin
    // Default assignments
    valid <= 1'b0;
    etu_cnt <= (etu_cnt + 1);
    state <= state;
    bit_cnt <= bit_cnt;
    data_in <= data_in;

    case(state)
      // Waiting for Start Bits
      `UART_START:
      begin
        if(din == 1'b0)
        begin
          // wait .5 ETUs
          if(etu_half)
          begin
            state <= `UART_DATA;
            etu_cnt <= 9'd0;
            bit_cnt <= 3'd0;
            data_in <= 8'd0;
          end
        end
        else
          etu_cnt <= 9'd0;
      end

      // Data Bits
      `UART_DATA:
      if(etu_full)
      begin
        etu_cnt <= 9'd0;
        data_in <= {din, data_in[7:1]};
        bit_cnt <= (bit_cnt + 1);

        if(bit_cnt == 3'd7)
          state <= `UART_STOP;
      end

      // Stop Bit(s)
      `UART_STOP:
      if(etu_full)
      begin
        etu_cnt <= 9'd0;
        state <= `UART_START;
        // Check Stop bit
        valid <= din;
      end

      default:
        $display ("UART RX: Invalid state 0x%X", state);

    endcase
  end
end

endmodule
