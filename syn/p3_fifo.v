`timescale 1 ns/100 ps
// Version: v11.1 11.1.0.14


module p3_fifo(
       DATA,
       Q,
       WE,
       RE,
       WCLOCK,
       RCLOCK,
       FULL,
       EMPTY,
       RESET,
       AEMPTY,
       AFULL
    );
input  [16:0] DATA;
output [16:0] Q;
input  WE;
input  RE;
input  WCLOCK;
input  RCLOCK;
output FULL;
output EMPTY;
input  RESET;
output AEMPTY;
output AFULL;

    wire WEBP, RESETP, WRITE_FSTOP_ENABLE, WRITE_ENABLE_I, 
        READ_ESTOP_ENABLE, READ_ENABLE_I, \FULLX_I[0] , \EMPTYX_I[0] , 
        \AFULLX_I[0] , \AEMPTYX_I[0] , \FULLX_I[1] , \EMPTYX_I[1] , 
        \AFULLX_I[1] , \AEMPTYX_I[1] , VCC, GND;
    wire GND_power_net1;
    wire VCC_power_net1;
    assign GND = GND_power_net1;
    assign VCC = VCC_power_net1;
    
    OR2 OR2_EMPTY (.A(\EMPTYX_I[0] ), .B(\EMPTYX_I[1] ), .Y(EMPTY));
    NAND2A WRITE_AND (.A(WEBP), .B(WRITE_FSTOP_ENABLE), .Y(
        WRITE_ENABLE_I));
    OR2 OR2_FULL (.A(\FULLX_I[0] ), .B(\FULLX_I[1] ), .Y(FULL));
    OR2 OR2_AEMPTY (.A(\AEMPTYX_I[0] ), .B(\AEMPTYX_I[1] ), .Y(AEMPTY));
    OR2 OR2_AFULL (.A(\AFULLX_I[0] ), .B(\AFULLX_I[1] ), .Y(AFULL));
    NAND2 READ_ESTOP_GATE (.A(EMPTY), .B(VCC), .Y(READ_ESTOP_ENABLE));
    INV RESETBUBBLEA (.A(RESET), .Y(RESETP));
    NAND2 WRITE_FSTOP_GATE (.A(FULL), .B(VCC), .Y(WRITE_FSTOP_ENABLE));
    AND2 READ_AND (.A(RE), .B(READ_ESTOP_ENABLE), .Y(READ_ENABLE_I));
    FIFO4K18 \FIFOBLOCK[0]  (.AEVAL11(GND), .AEVAL10(GND), .AEVAL9(GND)
        , .AEVAL8(GND), .AEVAL7(GND), .AEVAL6(GND), .AEVAL5(GND), 
        .AEVAL4(GND), .AEVAL3(VCC), .AEVAL2(GND), .AEVAL1(GND), 
        .AEVAL0(GND), .AFVAL11(GND), .AFVAL10(GND), .AFVAL9(GND), 
        .AFVAL8(GND), .AFVAL7(GND), .AFVAL6(GND), .AFVAL5(GND), 
        .AFVAL4(VCC), .AFVAL3(GND), .AFVAL2(GND), .AFVAL1(GND), 
        .AFVAL0(GND), .WD17(GND), .WD16(GND), .WD15(GND), .WD14(GND), 
        .WD13(GND), .WD12(GND), .WD11(GND), .WD10(GND), .WD9(GND), 
        .WD8(DATA[8]), .WD7(DATA[7]), .WD6(DATA[6]), .WD5(DATA[5]), 
        .WD4(DATA[4]), .WD3(DATA[3]), .WD2(DATA[2]), .WD1(DATA[1]), 
        .WD0(DATA[0]), .WW0(VCC), .WW1(VCC), .WW2(GND), .RW0(VCC), 
        .RW1(VCC), .RW2(GND), .RPIPE(GND), .WEN(WRITE_ENABLE_I), .REN(
        READ_ENABLE_I), .WBLK(GND), .RBLK(GND), .WCLK(WCLOCK), .RCLK(
        RCLOCK), .RESET(RESETP), .ESTOP(VCC), .FSTOP(VCC), .RD17(), 
        .RD16(), .RD15(), .RD14(), .RD13(), .RD12(), .RD11(), .RD10(), 
        .RD9(), .RD8(Q[8]), .RD7(Q[7]), .RD6(Q[6]), .RD5(Q[5]), .RD4(
        Q[4]), .RD3(Q[3]), .RD2(Q[2]), .RD1(Q[1]), .RD0(Q[0]), .FULL(
        \FULLX_I[0] ), .AFULL(\AFULLX_I[0] ), .EMPTY(\EMPTYX_I[0] ), 
        .AEMPTY(\AEMPTYX_I[0] ));
    FIFO4K18 \FIFOBLOCK[1]  (.AEVAL11(GND), .AEVAL10(GND), .AEVAL9(GND)
        , .AEVAL8(GND), .AEVAL7(GND), .AEVAL6(GND), .AEVAL5(GND), 
        .AEVAL4(GND), .AEVAL3(VCC), .AEVAL2(GND), .AEVAL1(GND), 
        .AEVAL0(GND), .AFVAL11(GND), .AFVAL10(GND), .AFVAL9(GND), 
        .AFVAL8(GND), .AFVAL7(GND), .AFVAL6(GND), .AFVAL5(GND), 
        .AFVAL4(VCC), .AFVAL3(GND), .AFVAL2(GND), .AFVAL1(GND), 
        .AFVAL0(GND), .WD17(GND), .WD16(GND), .WD15(GND), .WD14(GND), 
        .WD13(GND), .WD12(GND), .WD11(GND), .WD10(GND), .WD9(GND), 
        .WD8(GND), .WD7(DATA[16]), .WD6(DATA[15]), .WD5(DATA[14]), 
        .WD4(DATA[13]), .WD3(DATA[12]), .WD2(DATA[11]), .WD1(DATA[10]), 
        .WD0(DATA[9]), .WW0(VCC), .WW1(VCC), .WW2(GND), .RW0(VCC), 
        .RW1(VCC), .RW2(GND), .RPIPE(GND), .WEN(WRITE_ENABLE_I), .REN(
        READ_ENABLE_I), .WBLK(GND), .RBLK(GND), .WCLK(WCLOCK), .RCLK(
        RCLOCK), .RESET(RESETP), .ESTOP(VCC), .FSTOP(VCC), .RD17(), 
        .RD16(), .RD15(), .RD14(), .RD13(), .RD12(), .RD11(), .RD10(), 
        .RD9(), .RD8(), .RD7(Q[16]), .RD6(Q[15]), .RD5(Q[14]), .RD4(
        Q[13]), .RD3(Q[12]), .RD2(Q[11]), .RD1(Q[10]), .RD0(Q[9]), 
        .FULL(\FULLX_I[1] ), .AFULL(\AFULLX_I[1] ), .EMPTY(
        \EMPTYX_I[1] ), .AEMPTY(\AEMPTYX_I[1] ));
    INV WEBUBBLEA (.A(WE), .Y(WEBP));
    GND GND_power_inst1 (.Y(GND_power_net1));
    VCC VCC_power_inst1 (.Y(VCC_power_net1));
    
endmodule

// _Disclaimer: Please leave the following comments in the file, they are for internal purposes only._


// _GEN_File_Contents_

// Version:11.1.0.14
// ACTGENU_CALL:1
// BATCH:T
// FAM:ProASIC3
// OUTFORMAT:VERILOG
// LPMTYPE:LPM_FIFO
// LPM_HINT:NONE
// INSERT_PAD:NO
// INSERT_IOREG:NO
// GEN_BHV_VHDL_VAL:F
// GEN_BHV_VERILOG_VAL:F
// MGNTIMER:F
// MGNCMPL:F
// DESDIR:C:/Users/Dmitry Nedospasov/Documents/ddk-fpga/syn/ddk_smartgen\p3_fifo
// GEN_BEHV_MODULE:F
// SMARTGEN_DIE:UM4X2M1N
// SMARTGEN_PACKAGE:vq100
// AGENIII_IS_SUBPROJECT_LIBERO:F
// WWIDTH:17
// RWIDTH:17
// WDEPTH:512
// RDEPTH:512
// WE_POLARITY:1
// RE_POLARITY:1
// RCLK_EDGE:RISE
// WCLK_EDGE:RISE
// PMODE1:0
// FLAGS:STATIC
// AFVAL:2
// AEVAL:1
// ESTOP:NO
// FSTOP:NO
// AFVAL:2
// AEVAL:1
// AFFLAG_UNITS:WW
// AEFLAG_UNITS:RW
// DATA_IN_PN:DATA
// DATA_OUT_PN:Q
// WE_PN:WE
// RE_PN:RE
// WCLOCK_PN:WCLOCK
// RCLOCK_PN:RCLOCK
// ACLR_PN:RESET
// FF_PN:FULL
// EF_PN:EMPTY
// AF_PN:AFULL
// AE_PN:AEMPTY
// AF_PORT_PN:AFVAL
// AE_PORT_PN:AEVAL
// RESET_POLARITY:1

// _End_Comments_

