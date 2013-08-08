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

module  read_fifo(
    input wire        clk_i,
    input wire        rst_i,
    input wire        ack_i,
    input wire [7:0]  dat_i,
    input wire [7:0]  adr_o,
    input wire        stb_o,
    input wire        we_o,
    output wire       dout);

// State machine
reg [1:0] state;
`define FIFO_STATE_IDLE 0
`define FIFO_STATE_ACK  1
`define FIFO_STATE_ADR  2
`define FIFO_STATE_DAT  3

// Read CTL signals
wire       rd_valid;
wire       rd_ack;
wire [7:0] rd_adr;
wire [7:0] rd_dat;

// UART signals
reg       tx_en;
reg [7:0] tx_data;
wire      tx_rdy;

// Fifo Signals
wire        fifo_empty;
wire [16:0] fifo_q;
wire        fifo_re;
wire [16:0] fifo_data;

assign fifo_re = (state == `FIFO_STATE_IDLE && !fifo_empty);
assign fifo_data = {rd_ack,rd_adr,rd_dat};

// Internal signals
wire       ack = fifo_q[16];
wire [7:0] adr = fifo_q[15:8];
wire [7:0] dat = fifo_q[7:0];

read_ctl rdi(
    .clk_i(clk_i),
    .rst_i(rst_i),
    .ack_i(ack_i),
    .dat_i(dat_i),
    .adr_o(adr_o),
    .stb_o(stb_o),
    .we_o(we_o),
    .valid(rd_valid),
    .read_ack(rd_ack),
    .read_adr(rd_adr),
    .read_dat(rd_dat));


p3_fifo fifoi(
    .WCLOCK(clk_i),
    .RCLOCK(clk_i),
    .RESET(rst_i),
    .DATA(fifo_data),
    .WE(rd_valid),
    .Q(fifo_q),
    .RE(fifo_re),
    .EMPTY(fifo_empty));
    ////.FULL,
    ////.AEMPTY,
    ////.AFULL
    //);

uart_tx txi(
    .clk(clk_i),
    .rst(rst_i),
    .dout(dout),
    .data_out(tx_data),
    .en(tx_en),
    .rdy(tx_rdy));

always @(posedge clk_i)
begin
  if(rst_i)
  begin
    state <= `FIFO_STATE_IDLE;
    tx_en <= 1'b0;
  end
  else
  begin
    state <= state;
    tx_data <= tx_data;
    tx_en <= 1'b0;

    case(state)
      `FIFO_STATE_IDLE:
      begin
        if(fifo_re)
        begin
          state <= `FIFO_STATE_ACK;
        end
      end

      `FIFO_STATE_ACK:
      begin
        if(!tx_en && tx_rdy)
        begin
          tx_data <= {7'd0, ack};
          tx_en <= 1'b1;
          state <= `FIFO_STATE_ADR;
        end
      end

      `FIFO_STATE_ADR:
      begin
        if(!tx_en && tx_rdy)
        begin
          tx_data <= adr;
          tx_en <= 1'b1;
          state <= `FIFO_STATE_DAT;
        end
      end

      `FIFO_STATE_DAT:
      begin
        if(!tx_en && tx_rdy)
        begin
          tx_data <= dat;
          tx_en <= 1'b1;
          state <= `FIFO_STATE_IDLE;
        end
      end

    endcase
  end
end

endmodule
