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

module  read_ctl(
    input wire        clk_i,
    input wire        rst_i,
    input wire        ack_i,
    input wire [7:0]  dat_i,
    input wire [7:0]  adr_o,
    input wire        stb_o,
    input wire        we_o,
    output reg        valid,
    output reg        read_ack,
    output reg [7:0]  read_adr,
    output reg [7:0]  read_dat);

  reg [7:0] adr;
  reg read;

  always@(posedge clk_i)
  begin
    if(rst_i)
    begin
      valid <= 1'b0;
      read <= 1'b0;
    end // rst
    else
    begin
      read <= 1'b0;
      valid <= 1'b0;
      adr <= adr_o; // Latch the current address

      if(!we_o && stb_o)
        read <= 1'b1;

      if(read)
      begin
        valid <= 1'b1;
        read_dat <= dat_i;
        read_ack <= ack_i;
        read_adr <= adr;
      end
    end // !rst
  end

endmodule
