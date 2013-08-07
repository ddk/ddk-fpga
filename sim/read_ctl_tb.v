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
 */

`timescale 1 ns/1 ps

module read_ctl_tb();

reg tb_clk;
reg tb_rst;
reg tb_en;

reg        tb_we_o;
reg  [7:0] tb_adr_o;
reg        tb_stb_o;
reg [7:0]  tb_dat_i;
reg        tb_ack_i;

reg  [7:0] tb_cnt_a;
reg  [7:0] tb_cnt_d;

wire valid;
wire read_ack;
wire [7:0] read_adr;
wire [7:0] read_dat;

read_ctl rdi(
    .clk_i(tb_clk),
    .rst_i(tb_rst),
    .ack_i(tb_ack_i),
    .dat_i(tb_dat_i),
    .adr_o(tb_adr_o),
    .stb_o(tb_stb_o),
    .we_o(tb_we_o),
    .valid(valid),
    .read_ack(read_ack),
    .read_adr(read_adr),
    .read_dat(read_dat));



always
begin
  #20 tb_clk <= ~tb_clk;
end



initial
begin
  tb_clk <= 1'b0;
  tb_rst <= 1'b0;
  tb_en <= 1'b0;
  #5 tb_rst <= 1'b1;
  #20 tb_rst <= 1'b0;
  tb_en <= 1'b1;
end



// Create a watchdog counter
reg        tb_timeout;
reg [23:0] tb_timeout_cnt;

always @(posedge tb_clk)
begin
  tb_timeout <= 1'b0;
  tb_timeout_cnt <= tb_timeout_cnt + 1;
  if(tb_timeout_cnt == 24'd10000)
    tb_timeout <= 1'b1;
end



task wb_write;
input [7:0] adr_o;
input [7:0] dat_i;

begin
  @(posedge tb_clk);
  tb_stb_o <= 1'b1;
  tb_we_o <= 1'b1;
  tb_dat_i <= dat_i;
  tb_adr_o <= adr_o;

  @(posedge tb_clk);
  tb_stb_o <= 1'b0;

  if(!valid)
  begin
    $display("Write failed: 0x%02H, 0x%02H", tb_adr_o, tb_dat_i);
  end
end
endtask



// Emulate a read
task wb_read;
input [7:0] adr_o;
input [7:0] dat_i;

begin
  tb_timeout_cnt <= 24'd0; // Reset watchdog

  @(posedge tb_clk);
  tb_stb_o <= 1'b1;
  tb_we_o <= 1'b0;
  tb_adr_o <= adr_o;

  // TODO: don't always ack
  @(posedge tb_clk);
  tb_stb_o <= 1'b0;
  tb_dat_i <= dat_i;
  tb_ack_i <= 1'b1;

  wait(valid || tb_timeout)
  begin
    if(read_adr != adr_o)
    begin
      $display("Address mismatch: 0x%02H, 0x%02H", adr_o, read_adr);
      $stop;
    end

    if(read_dat != dat_i)
    begin
      $display("Read failed: 0x%02H, 0x%02H", dat_i, read_dat);
      $stop;
    end

    if(!read_ack || tb_timeout)
    begin
      $display("Read failed: 0x%02H, 0x%02H", adr_o, dat_i);
      $stop;
    end
  end
end
endtask



// bulk read
task bulk_read;
input [7:0] adr_o; // Next address
input [7:0] dat_i; // Next value
input [7:0] adr_e;
input [7:0] dat_e;

begin
  tb_stb_o <= 1'b1;
  tb_we_o <= 1'b0;
  tb_ack_i <= 1'b1;

  tb_timeout_cnt <= 24'd0; // Reset watchdog

  // TODO: don't always ack
  @(posedge tb_clk);
  tb_dat_i <= dat_i;
  tb_ack_i <= 1'b1;
  tb_adr_o <= adr_o;

  wait(valid || tb_timeout)
  begin
    if(read_adr != adr_e)
    begin
      $display("Address mismatch: 0x%02H, 0x%02H", read_adr, adr_e);
      $stop;
    end

    if(read_dat != dat_e)
    begin
      $display("Read failed: 0x%02H, 0x%02H", read_dat, dat_e);
      $stop;
    end

    if(tb_timeout)
    begin
      $display("Read failed: 0x%02H, 0x%02H", adr_o, dat_i);
      $stop;
    end
  end
end
endtask



reg        tb_ack;
reg [7:0]  tb_adr;
reg [7:0]  tb_dat;
reg [23:0] tb_adr_e;
reg [15:0] tb_dat_e;



always @(posedge tb_rst)
begin
  tb_dat_i <= 8'h00;
  tb_we_o <= 1'b0;
  tb_adr_o <= 8'd0;
  tb_cnt_a <= 8'd0;
  tb_cnt_d <= 8'd0;
  tb_adr_e <= 24'd0;
  tb_dat_e <= 16'd0;
end



initial
begin
  wait(tb_en)
  // (r/w) Peripheral configuration register
  repeat (256)
  begin
    tb_adr <= {$random} % 256;
    tb_dat <= {$random} % 256;
    wb_read(tb_adr,tb_dat);
  end
  
  // Clear out the previous values
  @(posedge tb_clk);
  tb_adr_o <= 8'd0;
  tb_dat_i <= 8'd0;
  tb_stb_o <= 1'b1;
  tb_we_o <= 1'b0;
  tb_ack_i <= 1'b1;
  @(posedge tb_clk);

  repeat (256)
  begin
    tb_adr_e <= {tb_adr_e[15:0], tb_adr};
    tb_dat_e <= {tb_dat_e[7:0], tb_dat};
    tb_adr <= {$random} % 256;
    tb_dat <= {$random} % 256;
    bulk_read(tb_adr, tb_dat, tb_adr_e[23:16], tb_dat_e[15:8]);
  end

  $display("Testbench completed successfully!");
  $stop;
end
endmodule
