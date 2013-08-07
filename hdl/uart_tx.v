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
 * Module:
 * Description:
 */

`include "../hdl/global_defs.v"
`include "../hdl/uart_defs.v"

module  uart_tx(
    input wire         clk,
    input wire         rst,
    output reg         dout,
    input wire [7:0]   data_out,
    input wire         en,
    output wire        rdy);

reg  [7:0]  data;
reg [1:0]  state;
reg [2:0] bit_cnt;
reg [8:0]  etu_cnt;

wire etu_full;
assign etu_full = (etu_cnt == `UART_FULL_ETU);

assign rdy = (state == `UART_START);

always  @ (posedge clk)
begin
  if (rst)
  begin
    state <= `UART_START;
    dout <= 1'b1;
  end

  else
  begin
    // Default assignments
    etu_cnt <= (etu_cnt + 1);
    dout <= dout;
    data <= data;
    state <= state;
    bit_cnt <= bit_cnt;

    case(state)

      // Idle, waiting for enable
      `UART_START:
      begin
        if(en == 1)
        begin
          // Start bit
          dout <= 1'b0;
          data <= data_out;
          state <= `UART_DATA;
          etu_cnt <= 9'd0;
          bit_cnt <= 3'd0;
        end
      end

      // Data Bits
      `UART_DATA:
      if(etu_full)
      begin
        etu_cnt <= 9'd0;
        bit_cnt <= (bit_cnt + 1);

        dout <= data[0];
        data <= {data[0], data[7:1]};

        if(bit_cnt == 3'd7)
        begin
          state <= `UART_STOP;
        end
      end

      // Stop Bit(s)
      `UART_STOP:
      if(etu_full)
      begin
        etu_cnt <= 9'd0;
        dout <= 1'b1;
        state <= `UART_IDLE;
      end

      // Idle time before restarting
      `UART_IDLE:
      if(etu_full)
      begin
        etu_cnt <= 9'd0;
        state <= `UART_START;
      end

      default:
        $display ("UART TX: Invalid state 0x%X", state);

    endcase
  end
end

endmodule
