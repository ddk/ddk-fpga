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
 * Module: ddk_core
 * Description: The core module. This can be safely simulated.
 */

`include "../hdl/reg_defs.v"


// TODO: wait a couple of clock cycles on Reset

module ddk_core(
        input   wire  SysClk,            // System Clock
        input   wire  SysRst,            // System Reset
        input   wire  TX1,               // LPC TXD1
        output  wire  RX1,               // LPC RXD1
        input   wire  DataClk,           // LPC TXD3
        input   wire  DataWe,            // LPC RXD3 (now an output)
        input   wire  [15:0]  DATA,      // Parallel Data
        input   wire  [5:0]    CH1_IN,   // CH1 Input
        output  wire  [5:0]    CH1_OUT,  // CH1 Output
        output  wire  [5:0]    CH1_OE,   // CH1 Output Enable
        input   wire  [5:0]    CH2_IN,   // CH2 Input
        output  wire  [5:0]    CH2_OUT,  // CH2 Output
        output  wire  [5:0]    CH2_OE,   // CH2 Output Enable
        input   wire  [5:0]    CH3_IN,   // CH3 Input
        output  wire  [5:0]    CH3_OUT,  // CH3 Output
        output  wire  [5:0]    CH3_OE,   // CH3 Output Enable
        input   wire  [5:0]    CH4_IN,   // CH4 Input
        output  wire  [5:0]    CH4_OUT,  // CH4 Output
        output  wire  [5:0]    CH4_OE,   // CH4 Output Enable
        input   wire  [5:0]    CH5_IN,   // CH5 Input
        output  wire  [5:0]    CH5_OUT,  // CH5 Output
        output  wire  [5:0]    CH5_OE,   // CH5 Output Enable
        input   wire  [5:0]    CH6_IN,   // CH6 Input
        output  wire  [5:0]    CH6_OUT,  // CH6 Output
        output  wire  [5:0]    CH6_OE,   // CH6 Output Enable
        input   wire  [5:0]    CH7_IN,   // CH7 Input
        output  wire  [5:0]    CH7_OUT,  // CH7 Output
        output  wire  [5:0]    CH7_OE,   // CH7 Output Enable
        input   wire  [5:0]    CH8_IN,   // CH8 Input
        output  wire  [5:0]    CH8_OUT,  // CH8 Output
        output  wire  [5:0]    CH8_OE);  // CH8 Output Enable

// Wishbone Signals
wire         stb_o;
wire         we_o;
wire  [7:0]  adr_o;
wire  [7:0]  dat_o;
reg   [7:0]  dat_i;
reg          ack_i;

// CH1
wire         ch1_stb_i; // WB Slave STB_I
wire [7:0]   ch1_dat_o; // WB Slave DAT_O
wire         ch1_ack_o; // WB Slave ACK_O
// CH2
wire         ch2_stb_i; // WB Slave STB_I
wire [7:0]   ch2_dat_o; // WB Slave DAT_O
wire         ch2_ack_o; // WB Slave ACK_O
// CH3
wire         ch3_stb_i; // WB Slave STB_I
wire [7:0]   ch3_dat_o; // WB Slave DAT_O
wire         ch3_ack_o; // WB Slave ACK_O
// CH4
wire         ch4_stb_i; // WB Slave STB_I
wire [7:0]   ch4_dat_o; // WB Slave DAT_O
wire         ch4_ack_o; // WB Slave ACK_O
// CH5
wire         ch5_stb_i; // WB Slave STB_I
wire [7:0]   ch5_dat_o; // WB Slave DAT_O
wire         ch5_ack_o; // WB Slave ACK_O
// CH6
wire         ch6_stb_i; // WB Slave STB_I
wire [7:0]   ch6_dat_o; // WB Slave DAT_O
wire         ch6_ack_o; // WB Slave ACK_O
// CH7
wire         ch7_stb_i; // WB Slave STB_I
wire [7:0]   ch7_dat_o; // WB Slave DAT_O
wire         ch7_ack_o; // WB Slave ACK_O
// CH8
wire         ch8_stb_i; // WB Slave STB_I
wire [7:0]   ch8_dat_o; // WB Slave DAT_O
wire         ch8_ack_o; // WB Slave ACK_O
// CLKA
wire         clka_stb_i; // WB Slave STB_I
wire [7:0]   clka_dat_o; // WB Slave DAT_O
wire         clka_ack_o; // WB Slave ACK_O
// CLKB
wire         clkb_stb_i; // WB Slave STB_I
wire [7:0]   clkb_dat_o; // WB Slave DAT_O
wire         clkb_ack_o; // WB Slave ACK_O
// CLKC
wire         clkc_stb_i; // WB Slave STB_I
wire [7:0]   clkc_dat_o; // WB Slave DAT_O
wire         clkc_ack_o; // WB Slave ACK_O
// CLKD
wire         clkd_stb_i; // WB Slave STB_I
wire [7:0]   clkd_dat_o; // WB Slave DAT_O
wire         clkd_ack_o; // WB Slave ACK_O

wire clka_posedge;
wire clka;
wire clkb_posedge;
wire clkb;
wire clkc_posedge;
wire clkc;
wire clkd_posedge;
wire clkd;

krake_bus ext_bus(
    .clk_i(SysClk),
    .rst_i(SysRst),
    .data(DATA),
    .data_clk(DataClk),
    .we(DataWe),
    .stb_o(stb_o),
    .adr_o(adr_o),
    .dat_o(dat_o),
    .we_o(we_o));

krake_port ch1(
    .clk_i(SysClk),
    .rst_i(SysRst),
    .ack_o(ch1_ack_o),
    .dat_i(dat_o),
    .adr_i(adr_o[3:0]),
    .dat_o(ch1_dat_o),
    .stb_i(ch1_stb_i),
    .we_i(we_o),
    .ch_in(CH1_IN),
    .ch_out(CH1_OUT),
    .ch_oe(CH1_OE),
    .clka(clka),
    .clkb(clkb),
    .clkc(clkc),
    .clkd(clkd));

krake_port ch2(
    .clk_i(SysClk),
    .rst_i(SysRst),
    .ack_o(ch2_ack_o),
    .dat_i(dat_o),
    .adr_i(adr_o[3:0]),
    .dat_o(ch2_dat_o),
    .stb_i(ch2_stb_i),
    .we_i(we_o),
    .ch_in(CH2_IN),
    .ch_out(CH2_OUT),
    .ch_oe(CH2_OE),
    .clka(clka),
    .clkb(clkb),
    .clkc(clkc),
    .clkd(clkd));

krake_port ch3(
    .clk_i(SysClk),
    .rst_i(SysRst),
    .ack_o(ch3_ack_o),
    .dat_i(dat_o),
    .adr_i(adr_o[3:0]),
    .dat_o(ch3_dat_o),
    .stb_i(ch3_stb_i),
    .we_i(we_o),
    .ch_in(CH3_IN),
    .ch_out(CH3_OUT),
    .ch_oe(CH3_OE),
    .clka(clka),
    .clkb(clkb),
    .clkc(clkc),
    .clkd(clkd));

krake_port ch4(
    .clk_i(SysClk),
    .rst_i(SysRst),
    .ack_o(ch4_ack_o),
    .dat_i(dat_o),
    .adr_i(adr_o[3:0]),
    .dat_o(ch4_dat_o),
    .stb_i(ch4_stb_i),
    .we_i(we_o),
    .ch_in(CH4_IN),
    .ch_out(CH4_OUT),
    .ch_oe(CH4_OE),
    .clka(clka),
    .clkb(clkb),
    .clkc(clkc),
    .clkd(clkd));

krake_port ch5(
    .clk_i(SysClk),
    .rst_i(SysRst),
    .ack_o(ch5_ack_o),
    .dat_i(dat_o),
    .adr_i(adr_o[3:0]),
    .dat_o(ch5_dat_o),
    .stb_i(ch5_stb_i),
    .we_i(we_o),
    .ch_in(CH5_IN),
    .ch_out(CH5_OUT),
    .ch_oe(CH5_OE),
    .clka(clka),
    .clkb(clkb),
    .clkc(clkc),
    .clkd(clkd));

krake_port ch6(
    .clk_i(SysClk),
    .rst_i(SysRst),
    .ack_o(ch6_ack_o),
    .dat_i(dat_o),
    .adr_i(adr_o[3:0]),
    .dat_o(ch6_dat_o),
    .stb_i(ch6_stb_i),
    .we_i(we_o),
    .ch_in(CH6_IN),
    .ch_out(CH6_OUT),
    .ch_oe(CH6_OE),
    .clka(clka),
    .clkb(clkb),
    .clkc(clkc),
    .clkd(clkd));

krake_port ch7(
    .clk_i(SysClk),
    .rst_i(SysRst),
    .ack_o(ch7_ack_o),
    .dat_i(dat_o),
    .adr_i(adr_o[3:0]),
    .dat_o(ch7_dat_o),
    .stb_i(ch7_stb_i),
    .we_i(we_o),
    .ch_in(CH7_IN),
    .ch_out(CH7_OUT),
    .ch_oe(CH7_OE),
    .clka(clka),
    .clkb(clkb),
    .clkc(clkc),
    .clkd(clkd));

krake_port ch8(
    .clk_i(SysClk),
    .rst_i(SysRst),
    .ack_o(ch8_ack_o),
    .dat_i(dat_o),
    .adr_i(adr_o[3:0]),
    .dat_o(ch8_dat_o),
    .stb_i(ch8_stb_i),
    .we_i(we_o),
    .ch_in(CH8_IN),
    .ch_out(CH8_OUT),
    .ch_oe(CH8_OE),
    .clka(clka),
    .clkb(clkb),
    .clkc(clkc),
    .clkd(clkd));

clk_gen clk_gena(
    .clk_i(SysClk),
    .rst_i(SysRst),
    .ack_o(clka_ack_o),
    .dat_i(dat_o),
    .adr_i(adr_o[3:0]),
    .dat_o(clka_dat_o),
    .stb_i(clka_stb_i),
    .we_i(we_o),
    .clk_posedge(clka_posedge),
    .clk_out(clka));

clk_gen clk_genb(
    .clk_i(SysClk),
    .rst_i(SysRst),
    .ack_o(clkb_ack_o),
    .dat_i(dat_o),
    .adr_i(adr_o[3:0]),
    .dat_o(clkb_dat_o),
    .stb_i(clkb_stb_i),
    .we_i(we_o),
    .clk_posedge(clkb_posedge),
    .clk_out(clkb));

clk_gen clk_genc(
    .clk_i(SysClk),
    .rst_i(SysRst),
    .ack_o(clkc_ack_o),
    .dat_i(dat_o),
    .adr_i(adr_o[3:0]),
    .dat_o(clkc_dat_o),
    .stb_i(clkc_stb_i),
    .we_i(we_o),
    .clk_posedge(clkc_posedge),
    .clk_out(clkc));

clk_gen clk_gend(
    .clk_i(SysClk),
    .rst_i(SysRst),
    .ack_o(clkd_ack_o),
    .dat_i(dat_o),
    .adr_i(adr_o[3:0]),
    .dat_o(clkd_dat_o),
    .stb_i(clkd_stb_i),
    .we_i(we_o),
    .clk_posedge(clkd_posedge),
    .clk_out(clkd));

// Generate Strobes for all channels on the bus
assign ch1_stb_i  = (stb_o && (adr_o[7:4] == `CH1_BASE));
assign ch2_stb_i  = (stb_o && (adr_o[7:4] == `CH2_BASE));
assign ch3_stb_i  = (stb_o && (adr_o[7:4] == `CH3_BASE));
assign ch4_stb_i  = (stb_o && (adr_o[7:4] == `CH4_BASE));
assign ch5_stb_i  = (stb_o && (adr_o[7:4] == `CH5_BASE));
assign ch6_stb_i  = (stb_o && (adr_o[7:4] == `CH6_BASE));
assign ch7_stb_i  = (stb_o && (adr_o[7:4] == `CH7_BASE));
assign ch8_stb_i  = (stb_o && (adr_o[7:4] == `CH8_BASE));
assign clka_stb_i = (stb_o && (adr_o[7:4] == `CLKA_BASE));
assign clkb_stb_i = (stb_o && (adr_o[7:4] == `CLKB_BASE));
assign clkc_stb_i = (stb_o && (adr_o[7:4] == `CLKC_BASE));
assign clkd_stb_i = (stb_o && (adr_o[7:4] == `CLKD_BASE));

// DAT/ACK multiplexer
always @ (
  adr_o or
  ch1_dat_o    or ch1_ack_o or
  ch2_dat_o    or ch2_ack_o or
  ch3_dat_o    or ch3_ack_o or
  ch4_dat_o    or ch4_ack_o or
  ch5_dat_o    or ch5_ack_o or
  ch6_dat_o    or ch6_ack_o or
  ch7_dat_o    or ch7_ack_o or
  ch8_dat_o    or ch8_ack_o or
  clka_dat_o   or clka_ack_o or
  clkb_dat_o   or clkb_ack_o or
  clkc_dat_o   or clkc_ack_o or
  clkd_dat_o   or clkd_ack_o)
begin

  //CH1 (Default)
  dat_i <= ch1_dat_o;
  ack_i <= ch1_ack_o;

  case(adr_o[7:4])
    // CH2
    `CH2_BASE:
    begin
      dat_i <= ch2_dat_o;
      ack_i <= ch2_ack_o;
    end
    // CH3
    `CH3_BASE:
    begin
      dat_i <= ch3_dat_o;
      ack_i <= ch3_ack_o;
    end
    // CH4
    `CH4_BASE:
    begin
      dat_i <= ch4_dat_o;
      ack_i <= ch4_ack_o;
    end
    // CH5
    `CH5_BASE:
    begin
      dat_i <= ch5_dat_o;
      ack_i <= ch5_ack_o;
    end
    // CH6
    `CH6_BASE:
    begin
      dat_i <= ch6_dat_o;
      ack_i <= ch6_ack_o;
    end
    // CH7
    `CH7_BASE:
    begin
      dat_i <= ch7_dat_o;
      ack_i <= ch7_ack_o;
    end
    // CH8
    `CH8_BASE:
    begin
      dat_i <= ch8_dat_o;
      ack_i <= ch8_ack_o;
    end
    // CLKA
    `CLKA_BASE:
    begin
      dat_i <= clka_dat_o;
      ack_i <= clka_ack_o;
    end
    // CLKB
    `CLKB_BASE:
    begin
      dat_i <= clkb_dat_o;
      ack_i <= clkb_ack_o;
    end
    // CLKC
    `CLKC_BASE:
    begin
      dat_i <= clkc_dat_o;
      ack_i <= clkc_ack_o;
    end
    // CLKD
    `CLKD_BASE:
    begin
      dat_i <= clkd_dat_o;
      ack_i <= clkd_ack_o;
    end
  endcase
end

endmodule
