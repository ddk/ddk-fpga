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

module ddk_top(
        input    wire  SysClk,        // System Clock
        input    wire  TX1,           // LPC TXD2
        output   wire  RX1,           // LPC RXD2
        input    wire  TX2,           // LPC TXD2
        input    wire  RX2,           // LPC RXD2
        input    wire  TX3,           // LPC TXD3
        input    wire  RX3,           // LPC RXD3
        input    wire  [15:0]  DATA,  // Parallel Data
        inout    wire  [5:0]    CH1,  // CH1
        inout    wire  [5:0]    CH2,  // CH2
        inout    wire  [5:0]    CH3,  // CH3
        inout    wire  [5:0]    CH4,  // CH4
        inout    wire  [5:0]    CH5,  // CH5
        inout    wire  [5:0]    CH6,  // CH6
        inout    wire  [5:0]    CH7,  // CH7
        inout    wire  [5:0]    CH8); // CH8

// CH1
wire [5:0] CORE_CH1_OUT;
wire [5:0] CORE_CH1_OE;
wire [5:0] CH1_IN;
reg [5:0] CH1_OUT;
reg [5:0] CH1_OE;

// CH2
wire [5:0] CORE_CH2_OUT;
wire [5:0] CORE_CH2_OE;
wire [5:0] CH2_IN;
reg [5:0] CH2_OUT;
reg [5:0] CH2_OE;

// CH3
wire [5:0] CORE_CH3_OUT;
wire [5:0] CORE_CH3_OE;
wire [5:0] CH3_IN;
reg [5:0] CH3_OUT;
reg [5:0] CH3_OE;

// CH4
wire [5:0] CORE_CH4_OUT;
wire [5:0] CORE_CH4_OE;
wire [5:0] CH4_IN;
reg [5:0] CH4_OUT;
reg [5:0] CH4_OE;

// CH5
wire [5:0] CORE_CH5_OUT;
wire [5:0] CORE_CH5_OE;
wire [5:0] CH5_IN;
reg [5:0] CH5_OUT;
reg [5:0] CH5_OE;

// CH6
wire [5:0] CORE_CH6_OUT;
wire [5:0] CORE_CH6_OE;
wire [5:0] CH6_IN;
reg [5:0] CH6_OUT;
reg [5:0] CH6_OE;

// CH7
wire [5:0] CORE_CH7_OUT;
wire [5:0] CORE_CH7_OE;
wire [5:0] CH7_IN;
reg [5:0] CH7_OUT;
reg [5:0] CH7_OE;

// CH8
wire [5:0] CORE_CH8_OUT;
wire [5:0] CORE_CH8_OE;
wire [5:0] CH8_IN;
reg [5:0] CH8_OUT;
reg [5:0] CH8_OE;

// DATA
wire [15:0] DATA_IN;

wire TestMode;
assign TestMode = TX1;

wire TestEn;
assign TestEn = RX2;

wire SysRst;
assign SysRst = TX2;

wire DataWe;
assign DataWe = RX3;

wire DataClk;
assign DataClk = TX3;

ddk_core corei(
        .SysClk(SysClk),        // System Clock
        .SysRst(SysRst),        // System RST
        .TX1(TX1),              // LPC TXD1
        .RX1(RX1),              // LPC RXD1
        .DataClk(DataClk),      // LPC TXD3
        .DataWe(DataWe),        // LPC RXD3
        .DATA(DATA_IN),         // Parallel Data
        .CH1_IN(CH1_IN),        // CH1 Input
        .CH1_OUT(CORE_CH1_OUT), // CH1 Output
        .CH1_OE(CORE_CH1_OE),   // CH1 Output enable
        .CH2_IN(CH2_IN),        // CH2 Input
        .CH2_OUT(CORE_CH2_OUT), // CH2 Output
        .CH2_OE(CORE_CH2_OE),   // CH2 Output enable
        .CH3_IN(CH3_IN),        // CH3 Input
        .CH3_OUT(CORE_CH3_OUT), // CH3 Output
        .CH3_OE(CORE_CH3_OE),   // CH3 Output enable
        .CH4_IN(CH4_IN),        // CH4 Input
        .CH4_OUT(CORE_CH4_OUT), // CH4 Output
        .CH4_OE(CORE_CH4_OE),   // CH4 Output enable
        .CH5_IN(CH5_IN),        // CH5 Input
        .CH5_OUT(CORE_CH5_OUT), // CH5 Output
        .CH5_OE(CORE_CH5_OE),   // CH5 Output enable
        .CH6_IN(CH6_IN),        // CH6 Input
        .CH6_OUT(CORE_CH6_OUT), // CH6 Output
        .CH6_OE(CORE_CH6_OE),   // CH6 Output enable
        .CH7_IN(CH7_IN),        // CH7 Input
        .CH7_OUT(CORE_CH7_OUT), // CH7 Output
        .CH7_OE(CORE_CH7_OE),   // CH7 Output enable
        .CH8_IN(CH8_IN),        // CH8 Input
        .CH8_OUT(CORE_CH8_OUT), // CH8 Output
        .CH8_OE(CORE_CH8_OE));  // CH8 Output enable

// CH1
BIBUF \BUF_CH1[0]  (.PAD(CH1[0]), .D(CH1_OUT[0]), .E(CH1_OE[0]), .Y(CH1_IN[0]));
BIBUF \BUF_CH1[1]  (.PAD(CH1[1]), .D(CH1_OUT[1]), .E(CH1_OE[1]), .Y(CH1_IN[1]));
BIBUF \BUF_CH1[2]  (.PAD(CH1[2]), .D(CH1_OUT[2]), .E(CH1_OE[2]), .Y(CH1_IN[2]));
BIBUF \BUF_CH1[3]  (.PAD(CH1[3]), .D(CH1_OUT[3]), .E(CH1_OE[3]), .Y(CH1_IN[3]));
BIBUF \BUF_CH1[4]  (.PAD(CH1[4]), .D(CH1_OUT[4]), .E(CH1_OE[4]), .Y(CH1_IN[4]));
BIBUF \BUF_CH1[5]  (.PAD(CH1[5]), .D(CH1_OUT[5]), .E(CH1_OE[5]), .Y(CH1_IN[5]));

// CH2
BIBUF \BUF_CH2[0]  (.PAD(CH2[0]), .D(CH2_OUT[0]), .E(CH2_OE[0]), .Y(CH2_IN[0]));
BIBUF \BUF_CH2[1]  (.PAD(CH2[1]), .D(CH2_OUT[1]), .E(CH2_OE[1]), .Y(CH2_IN[1]));
BIBUF \BUF_CH2[2]  (.PAD(CH2[2]), .D(CH2_OUT[2]), .E(CH2_OE[2]), .Y(CH2_IN[2]));
BIBUF \BUF_CH2[3]  (.PAD(CH2[3]), .D(CH2_OUT[3]), .E(CH2_OE[3]), .Y(CH2_IN[3]));
BIBUF \BUF_CH2[4]  (.PAD(CH2[4]), .D(CH2_OUT[4]), .E(CH2_OE[4]), .Y(CH2_IN[4]));
BIBUF \BUF_CH2[5]  (.PAD(CH2[5]), .D(CH2_OUT[5]), .E(CH2_OE[5]), .Y(CH2_IN[5]));

// CH3
BIBUF \BUF_CH3[0]  (.PAD(CH3[0]), .D(CH3_OUT[0]), .E(CH3_OE[0]), .Y(CH3_IN[0]));
BIBUF \BUF_CH3[1]  (.PAD(CH3[1]), .D(CH3_OUT[1]), .E(CH3_OE[1]), .Y(CH3_IN[1]));
BIBUF \BUF_CH3[2]  (.PAD(CH3[2]), .D(CH3_OUT[2]), .E(CH3_OE[2]), .Y(CH3_IN[2]));
BIBUF \BUF_CH3[3]  (.PAD(CH3[3]), .D(CH3_OUT[3]), .E(CH3_OE[3]), .Y(CH3_IN[3]));
BIBUF \BUF_CH3[4]  (.PAD(CH3[4]), .D(CH3_OUT[4]), .E(CH3_OE[4]), .Y(CH3_IN[4]));
BIBUF \BUF_CH3[5]  (.PAD(CH3[5]), .D(CH3_OUT[5]), .E(CH3_OE[5]), .Y(CH3_IN[5]));

// CH4
BIBUF \BUF_CH4[0]  (.PAD(CH4[0]), .D(CH4_OUT[0]), .E(CH4_OE[0]), .Y(CH4_IN[0]));
BIBUF \BUF_CH4[1]  (.PAD(CH4[1]), .D(CH4_OUT[1]), .E(CH4_OE[1]), .Y(CH4_IN[1]));
BIBUF \BUF_CH4[2]  (.PAD(CH4[2]), .D(CH4_OUT[2]), .E(CH4_OE[2]), .Y(CH4_IN[2]));
BIBUF \BUF_CH4[3]  (.PAD(CH4[3]), .D(CH4_OUT[3]), .E(CH4_OE[3]), .Y(CH4_IN[3]));
BIBUF \BUF_CH4[4]  (.PAD(CH4[4]), .D(CH4_OUT[4]), .E(CH4_OE[4]), .Y(CH4_IN[4]));
BIBUF \BUF_CH4[5]  (.PAD(CH4[5]), .D(CH4_OUT[5]), .E(CH4_OE[5]), .Y(CH4_IN[5]));

// CH5
BIBUF \BUF_CH5[0]  (.PAD(CH5[0]), .D(CH5_OUT[0]), .E(CH5_OE[0]), .Y(CH5_IN[0]));
BIBUF \BUF_CH5[1]  (.PAD(CH5[1]), .D(CH5_OUT[1]), .E(CH5_OE[1]), .Y(CH5_IN[1]));
BIBUF \BUF_CH5[2]  (.PAD(CH5[2]), .D(CH5_OUT[2]), .E(CH5_OE[2]), .Y(CH5_IN[2]));
BIBUF \BUF_CH5[3]  (.PAD(CH5[3]), .D(CH5_OUT[3]), .E(CH5_OE[3]), .Y(CH5_IN[3]));
BIBUF \BUF_CH5[4]  (.PAD(CH5[4]), .D(CH5_OUT[4]), .E(CH5_OE[4]), .Y(CH5_IN[4]));
BIBUF \BUF_CH5[5]  (.PAD(CH5[5]), .D(CH5_OUT[5]), .E(CH5_OE[5]), .Y(CH5_IN[5]));

// CH6
BIBUF \BUF_CH6[0]  (.PAD(CH6[0]), .D(CH6_OUT[0]), .E(CH6_OE[0]), .Y(CH6_IN[0]));
BIBUF \BUF_CH6[1]  (.PAD(CH6[1]), .D(CH6_OUT[1]), .E(CH6_OE[1]), .Y(CH6_IN[1]));
BIBUF \BUF_CH6[2]  (.PAD(CH6[2]), .D(CH6_OUT[2]), .E(CH6_OE[2]), .Y(CH6_IN[2]));
BIBUF \BUF_CH6[3]  (.PAD(CH6[3]), .D(CH6_OUT[3]), .E(CH6_OE[3]), .Y(CH6_IN[3]));
BIBUF \BUF_CH6[4]  (.PAD(CH6[4]), .D(CH6_OUT[4]), .E(CH6_OE[4]), .Y(CH6_IN[4]));
BIBUF \BUF_CH6[5]  (.PAD(CH6[5]), .D(CH6_OUT[5]), .E(CH6_OE[5]), .Y(CH6_IN[5]));

// CH7
BIBUF \BUF_CH7[0]  (.PAD(CH7[0]), .D(CH7_OUT[0]), .E(CH7_OE[0]), .Y(CH7_IN[0]));
BIBUF \BUF_CH7[1]  (.PAD(CH7[1]), .D(CH7_OUT[1]), .E(CH7_OE[1]), .Y(CH7_IN[1]));
BIBUF \BUF_CH7[2]  (.PAD(CH7[2]), .D(CH7_OUT[2]), .E(CH7_OE[2]), .Y(CH7_IN[2]));
BIBUF \BUF_CH7[3]  (.PAD(CH7[3]), .D(CH7_OUT[3]), .E(CH7_OE[3]), .Y(CH7_IN[3]));
BIBUF \BUF_CH7[4]  (.PAD(CH7[4]), .D(CH7_OUT[4]), .E(CH7_OE[4]), .Y(CH7_IN[4]));
BIBUF \BUF_CH7[5]  (.PAD(CH7[5]), .D(CH7_OUT[5]), .E(CH7_OE[5]), .Y(CH7_IN[5]));

// CH8
BIBUF \BUF_CH8[0]  (.PAD(CH8[0]), .D(CH8_OUT[0]), .E(CH8_OE[0]), .Y(CH8_IN[0]));
BIBUF \BUF_CH8[1]  (.PAD(CH8[1]), .D(CH8_OUT[1]), .E(CH8_OE[1]), .Y(CH8_IN[1]));
BIBUF \BUF_CH8[2]  (.PAD(CH8[2]), .D(CH8_OUT[2]), .E(CH8_OE[2]), .Y(CH8_IN[2]));
BIBUF \BUF_CH8[3]  (.PAD(CH8[3]), .D(CH8_OUT[3]), .E(CH8_OE[3]), .Y(CH8_IN[3]));
BIBUF \BUF_CH8[4]  (.PAD(CH8[4]), .D(CH8_OUT[4]), .E(CH8_OE[4]), .Y(CH8_IN[4]));
BIBUF \BUF_CH8[5]  (.PAD(CH8[5]), .D(CH8_OUT[5]), .E(CH8_OE[5]), .Y(CH8_IN[5]));

assign DATA_IN[15:12] = DATA[15:12];

wire [5:0] TEST_IN;
assign TEST_IN = {RX3,TX3,DATA_IN[15:12]};

wire [11:0] TEST_OUT;
assign TEST_OUT = TestMode ? {~CH5_IN,~CH1_IN} : {~CH8_IN,~CH4_IN};

// DATA
BIBUF \BUF_DATA[0]  (.PAD(DATA[0]),   .D(TEST_OUT[0]),  .E(TestEn), .Y(DATA_IN[0]));
BIBUF \BUF_DATA[1]  (.PAD(DATA[1]),   .D(TEST_OUT[1]),  .E(TestEn), .Y(DATA_IN[1]));
BIBUF \BUF_DATA[2]  (.PAD(DATA[2]),   .D(TEST_OUT[2]),  .E(TestEn), .Y(DATA_IN[2]));
BIBUF \BUF_DATA[3]  (.PAD(DATA[3]),   .D(TEST_OUT[3]),  .E(TestEn), .Y(DATA_IN[3]));
BIBUF \BUF_DATA[4]  (.PAD(DATA[4]),   .D(TEST_OUT[4]),  .E(TestEn), .Y(DATA_IN[4]));
BIBUF \BUF_DATA[5]  (.PAD(DATA[5]),   .D(TEST_OUT[5]),  .E(TestEn), .Y(DATA_IN[5]));
BIBUF \BUF_DATA[6]  (.PAD(DATA[6]),   .D(TEST_OUT[6]),  .E(TestEn), .Y(DATA_IN[6]));
BIBUF \BUF_DATA[7]  (.PAD(DATA[7]),   .D(TEST_OUT[7]),  .E(TestEn), .Y(DATA_IN[7]));
BIBUF \BUF_DATA[8]  (.PAD(DATA[8]),   .D(TEST_OUT[8]),  .E(TestEn), .Y(DATA_IN[8]));
BIBUF \BUF_DATA[9]  (.PAD(DATA[9]),   .D(TEST_OUT[9]),  .E(TestEn), .Y(DATA_IN[9]));
BIBUF \BUF_DATA[10]  (.PAD(DATA[10]),  .D(TEST_OUT[10]),  .E(TestEn), .Y(DATA_IN[10]));
BIBUF \BUF_DATA[11]  (.PAD(DATA[11]),  .D(TEST_OUT[11]),  .E(TestEn), .Y(DATA_IN[11]));

always @(*)
begin
  CH1_OUT <= CORE_CH1_OUT;
  CH1_OE <= CORE_CH1_OE;
  CH2_OUT <= CORE_CH2_OUT;
  CH2_OE <= CORE_CH2_OE;
  CH3_OUT <= CORE_CH3_OUT;
  CH3_OE <= CORE_CH3_OE;
  CH4_OUT <= CORE_CH4_OUT;
  CH4_OE <= CORE_CH4_OE;
  CH5_OUT <= CORE_CH5_OUT;
  CH5_OE <= CORE_CH5_OE;
  CH6_OUT <= CORE_CH6_OUT;
  CH6_OE <= CORE_CH6_OE;
  CH7_OUT <= CORE_CH7_OUT;
  CH7_OE <= CORE_CH7_OE;
  CH8_OUT <= CORE_CH8_OUT;
  CH8_OE <= CORE_CH8_OE;

  if(TestEn)
  begin
    CH1_OUT <= TEST_IN;
    CH3_OUT <= ~CH2_IN;
    CH5_OUT <= TEST_IN;
    CH7_OUT <= ~CH6_IN;

    CH1_OE <= 6'b111111;
    CH2_OE <= 6'b000000;
    CH3_OE <= 6'b111111;
    CH4_OE <= 6'b000000;
    CH5_OE <= 6'b111111;
    CH6_OE <= 6'b000000;
    CH7_OE <= 6'b111111;
    CH8_OE <= 6'b000000;

    if(TestMode)
    begin
      CH8_OUT <= TEST_IN;
      CH6_OUT <= ~CH7_IN;
      CH4_OUT <= TEST_IN;
      CH2_OUT <= ~CH3_IN;

      CH1_OE <= 6'b000000;
      CH2_OE <= 6'b111111;
      CH3_OE <= 6'b000000;
      CH4_OE <= 6'b111111;
      CH5_OE <= 6'b000000;
      CH6_OE <= 6'b111111;
      CH7_OE <= 6'b000000;
      CH8_OE <= 6'b111111;
    end
  end
end

endmodule
