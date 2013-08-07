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
        \AFULLX_I[1] , \AEMPTYX_I[1] , \FULLX_I[2] , \EMPTYX_I[2] , 
        \AFULLX_I[2] , \AEMPTYX_I[2] , \FULLX_I[3] , \EMPTYX_I[3] , 
        \AFULLX_I[3] , \AEMPTYX_I[3] , \FULLX_I[4] , \EMPTYX_I[4] , 
        \AFULLX_I[4] , \AEMPTYX_I[4] , \FULLX_I[5] , \EMPTYX_I[5] , 
        \AFULLX_I[5] , \AEMPTYX_I[5] , \FULLX_I[6] , \EMPTYX_I[6] , 
        \AFULLX_I[6] , \AEMPTYX_I[6] , \FULLX_I[7] , \EMPTYX_I[7] , 
        \AFULLX_I[7] , \AEMPTYX_I[7] , \FULLX_I[8] , \EMPTYX_I[8] , 
        \AFULLX_I[8] , \AEMPTYX_I[8] , \FULLX_I[9] , \EMPTYX_I[9] , 
        \AFULLX_I[9] , \AEMPTYX_I[9] , \FULLX_I[10] , \EMPTYX_I[10] , 
        \AFULLX_I[10] , \AEMPTYX_I[10] , \FULLX_I[11] , \EMPTYX_I[11] , 
        \AFULLX_I[11] , \AEMPTYX_I[11] , \FULLX_I[12] , \EMPTYX_I[12] , 
        \AFULLX_I[12] , \AEMPTYX_I[12] , \FULLX_I[13] , \EMPTYX_I[13] , 
        \AFULLX_I[13] , \AEMPTYX_I[13] , \FULLX_I[14] , \EMPTYX_I[14] , 
        \AFULLX_I[14] , \AEMPTYX_I[14] , \FULLX_I[15] , \EMPTYX_I[15] , 
        \AFULLX_I[15] , \AEMPTYX_I[15] , \FULLX_I[16] , \EMPTYX_I[16] , 
        \AFULLX_I[16] , \AEMPTYX_I[16] , OR2_59_Y, OR2_52_Y, OR2_37_Y, 
        OR2_43_Y, OR2_47_Y, OR2_34_Y, OR2_35_Y, OR2_57_Y, OR2_7_Y, 
        OR2_40_Y, OR2_26_Y, OR2_39_Y, OR2_24_Y, OR2_33_Y, OR2_48_Y, 
        OR2_42_Y, OR2_18_Y, OR2_30_Y, OR2_16_Y, OR2_27_Y, OR2_56_Y, 
        OR2_0_Y, OR2_9_Y, OR2_54_Y, OR2_15_Y, OR2_36_Y, OR2_55_Y, 
        OR2_17_Y, OR2_51_Y, OR2_19_Y, OR2_53_Y, OR2_25_Y, OR2_58_Y, 
        OR2_29_Y, OR2_32_Y, OR2_28_Y, OR2_14_Y, OR2_20_Y, OR2_49_Y, 
        OR2_13_Y, OR2_4_Y, OR2_44_Y, OR2_6_Y, OR2_2_Y, OR2_31_Y, 
        OR2_41_Y, OR2_1_Y, OR2_5_Y, OR2_38_Y, OR2_46_Y, OR2_12_Y, 
        OR2_50_Y, OR2_8_Y, OR2_23_Y, OR2_22_Y, OR2_10_Y, OR2_21_Y, 
        OR2_45_Y, OR2_11_Y, OR2_3_Y, VCC, GND;
    wire GND_power_net1;
    wire VCC_power_net1;
    assign GND = GND_power_net1;
    assign VCC = VCC_power_net1;
    
    OR2 OR2_10 (.A(\AEMPTYX_I[9] ), .B(\AEMPTYX_I[10] ), .Y(OR2_10_Y));
    OR2 OR2_56 (.A(OR2_17_Y), .B(OR2_51_Y), .Y(OR2_56_Y));
    OR2 OR2_35 (.A(OR2_48_Y), .B(\EMPTYX_I[2] ), .Y(OR2_35_Y));
    OR2 OR2_31 (.A(\FULLX_I[0] ), .B(\FULLX_I[1] ), .Y(OR2_31_Y));
    FIFO4K18 \FIFOBLOCK[11]  (.AEVAL11(GND), .AEVAL10(GND), .AEVAL9(
        GND), .AEVAL8(GND), .AEVAL7(GND), .AEVAL6(GND), .AEVAL5(GND), 
        .AEVAL4(GND), .AEVAL3(GND), .AEVAL2(GND), .AEVAL1(GND), 
        .AEVAL0(VCC), .AFVAL11(GND), .AFVAL10(GND), .AFVAL9(GND), 
        .AFVAL8(GND), .AFVAL7(GND), .AFVAL6(GND), .AFVAL5(GND), 
        .AFVAL4(GND), .AFVAL3(GND), .AFVAL2(GND), .AFVAL1(VCC), 
        .AFVAL0(GND), .WD17(GND), .WD16(GND), .WD15(GND), .WD14(GND), 
        .WD13(GND), .WD12(GND), .WD11(GND), .WD10(GND), .WD9(GND), 
        .WD8(GND), .WD7(GND), .WD6(GND), .WD5(GND), .WD4(GND), .WD3(
        GND), .WD2(GND), .WD1(GND), .WD0(DATA[11]), .WW0(GND), .WW1(
        GND), .WW2(GND), .RW0(GND), .RW1(GND), .RW2(GND), .RPIPE(GND), 
        .WEN(WRITE_ENABLE_I), .REN(READ_ENABLE_I), .WBLK(GND), .RBLK(
        GND), .WCLK(WCLOCK), .RCLK(RCLOCK), .RESET(RESETP), .ESTOP(VCC)
        , .FSTOP(VCC), .RD17(), .RD16(), .RD15(), .RD14(), .RD13(), 
        .RD12(), .RD11(), .RD10(), .RD9(), .RD8(), .RD7(), .RD6(), 
        .RD5(), .RD4(), .RD3(), .RD2(), .RD1(), .RD0(Q[11]), .FULL(
        \FULLX_I[11] ), .AFULL(\AFULLX_I[11] ), .EMPTY(\EMPTYX_I[11] ), 
        .AEMPTY(\AEMPTYX_I[11] ));
    FIFO4K18 \FIFOBLOCK[13]  (.AEVAL11(GND), .AEVAL10(GND), .AEVAL9(
        GND), .AEVAL8(GND), .AEVAL7(GND), .AEVAL6(GND), .AEVAL5(GND), 
        .AEVAL4(GND), .AEVAL3(GND), .AEVAL2(GND), .AEVAL1(GND), 
        .AEVAL0(VCC), .AFVAL11(GND), .AFVAL10(GND), .AFVAL9(GND), 
        .AFVAL8(GND), .AFVAL7(GND), .AFVAL6(GND), .AFVAL5(GND), 
        .AFVAL4(GND), .AFVAL3(GND), .AFVAL2(GND), .AFVAL1(VCC), 
        .AFVAL0(GND), .WD17(GND), .WD16(GND), .WD15(GND), .WD14(GND), 
        .WD13(GND), .WD12(GND), .WD11(GND), .WD10(GND), .WD9(GND), 
        .WD8(GND), .WD7(GND), .WD6(GND), .WD5(GND), .WD4(GND), .WD3(
        GND), .WD2(GND), .WD1(GND), .WD0(DATA[13]), .WW0(GND), .WW1(
        GND), .WW2(GND), .RW0(GND), .RW1(GND), .RW2(GND), .RPIPE(GND), 
        .WEN(WRITE_ENABLE_I), .REN(READ_ENABLE_I), .WBLK(GND), .RBLK(
        GND), .WCLK(WCLOCK), .RCLK(RCLOCK), .RESET(RESETP), .ESTOP(VCC)
        , .FSTOP(VCC), .RD17(), .RD16(), .RD15(), .RD14(), .RD13(), 
        .RD12(), .RD11(), .RD10(), .RD9(), .RD8(), .RD7(), .RD6(), 
        .RD5(), .RD4(), .RD3(), .RD2(), .RD1(), .RD0(Q[13]), .FULL(
        \FULLX_I[13] ), .AFULL(\AFULLX_I[13] ), .EMPTY(\EMPTYX_I[13] ), 
        .AEMPTY(\AEMPTYX_I[13] ));
    OR2 OR2_32 (.A(OR2_4_Y), .B(OR2_44_Y), .Y(OR2_32_Y));
    OR2 OR2_28 (.A(OR2_6_Y), .B(OR2_2_Y), .Y(OR2_28_Y));
    OR2 OR2_14 (.A(OR2_31_Y), .B(\FULLX_I[2] ), .Y(OR2_14_Y));
    OR2 OR2_AFULL (.A(OR2_42_Y), .B(OR2_18_Y), .Y(AFULL));
    OR2 OR2_37 (.A(OR2_35_Y), .B(OR2_57_Y), .Y(OR2_37_Y));
    FIFO4K18 \FIFOBLOCK[2]  (.AEVAL11(GND), .AEVAL10(GND), .AEVAL9(GND)
        , .AEVAL8(GND), .AEVAL7(GND), .AEVAL6(GND), .AEVAL5(GND), 
        .AEVAL4(GND), .AEVAL3(GND), .AEVAL2(GND), .AEVAL1(GND), 
        .AEVAL0(VCC), .AFVAL11(GND), .AFVAL10(GND), .AFVAL9(GND), 
        .AFVAL8(GND), .AFVAL7(GND), .AFVAL6(GND), .AFVAL5(GND), 
        .AFVAL4(GND), .AFVAL3(GND), .AFVAL2(GND), .AFVAL1(VCC), 
        .AFVAL0(GND), .WD17(GND), .WD16(GND), .WD15(GND), .WD14(GND), 
        .WD13(GND), .WD12(GND), .WD11(GND), .WD10(GND), .WD9(GND), 
        .WD8(GND), .WD7(GND), .WD6(GND), .WD5(GND), .WD4(GND), .WD3(
        GND), .WD2(GND), .WD1(GND), .WD0(DATA[2]), .WW0(GND), .WW1(GND)
        , .WW2(GND), .RW0(GND), .RW1(GND), .RW2(GND), .RPIPE(GND), 
        .WEN(WRITE_ENABLE_I), .REN(READ_ENABLE_I), .WBLK(GND), .RBLK(
        GND), .WCLK(WCLOCK), .RCLK(RCLOCK), .RESET(RESETP), .ESTOP(VCC)
        , .FSTOP(VCC), .RD17(), .RD16(), .RD15(), .RD14(), .RD13(), 
        .RD12(), .RD11(), .RD10(), .RD9(), .RD8(), .RD7(), .RD6(), 
        .RD5(), .RD4(), .RD3(), .RD2(), .RD1(), .RD0(Q[2]), .FULL(
        \FULLX_I[2] ), .AFULL(\AFULLX_I[2] ), .EMPTY(\EMPTYX_I[2] ), 
        .AEMPTY(\AEMPTYX_I[2] ));
    OR2 OR2_5 (.A(OR2_50_Y), .B(OR2_8_Y), .Y(OR2_5_Y));
    FIFO4K18 \FIFOBLOCK[10]  (.AEVAL11(GND), .AEVAL10(GND), .AEVAL9(
        GND), .AEVAL8(GND), .AEVAL7(GND), .AEVAL6(GND), .AEVAL5(GND), 
        .AEVAL4(GND), .AEVAL3(GND), .AEVAL2(GND), .AEVAL1(GND), 
        .AEVAL0(VCC), .AFVAL11(GND), .AFVAL10(GND), .AFVAL9(GND), 
        .AFVAL8(GND), .AFVAL7(GND), .AFVAL6(GND), .AFVAL5(GND), 
        .AFVAL4(GND), .AFVAL3(GND), .AFVAL2(GND), .AFVAL1(VCC), 
        .AFVAL0(GND), .WD17(GND), .WD16(GND), .WD15(GND), .WD14(GND), 
        .WD13(GND), .WD12(GND), .WD11(GND), .WD10(GND), .WD9(GND), 
        .WD8(GND), .WD7(GND), .WD6(GND), .WD5(GND), .WD4(GND), .WD3(
        GND), .WD2(GND), .WD1(GND), .WD0(DATA[10]), .WW0(GND), .WW1(
        GND), .WW2(GND), .RW0(GND), .RW1(GND), .RW2(GND), .RPIPE(GND), 
        .WEN(WRITE_ENABLE_I), .REN(READ_ENABLE_I), .WBLK(GND), .RBLK(
        GND), .WCLK(WCLOCK), .RCLK(RCLOCK), .RESET(RESETP), .ESTOP(VCC)
        , .FSTOP(VCC), .RD17(), .RD16(), .RD15(), .RD14(), .RD13(), 
        .RD12(), .RD11(), .RD10(), .RD9(), .RD8(), .RD7(), .RD6(), 
        .RD5(), .RD4(), .RD3(), .RD2(), .RD1(), .RD0(Q[10]), .FULL(
        \FULLX_I[10] ), .AFULL(\AFULLX_I[10] ), .EMPTY(\EMPTYX_I[10] ), 
        .AEMPTY(\AEMPTYX_I[10] ));
    OR2 OR2_40 (.A(\EMPTYX_I[7] ), .B(\EMPTYX_I[8] ), .Y(OR2_40_Y));
    OR2 OR2_15 (.A(\AFULLX_I[7] ), .B(\AFULLX_I[8] ), .Y(OR2_15_Y));
    OR2 OR2_11 (.A(\AEMPTYX_I[15] ), .B(\AEMPTYX_I[16] ), .Y(OR2_11_Y));
    OR2 OR2_12 (.A(OR2_45_Y), .B(OR2_11_Y), .Y(OR2_12_Y));
    INV RESETBUBBLEA (.A(RESET), .Y(RESETP));
    OR2 OR2_58 (.A(OR2_14_Y), .B(OR2_20_Y), .Y(OR2_58_Y));
    OR2 OR2_39 (.A(\EMPTYX_I[11] ), .B(\EMPTYX_I[12] ), .Y(OR2_39_Y));
    OR2 OR2_FULL (.A(OR2_53_Y), .B(OR2_25_Y), .Y(FULL));
    NAND2 READ_ESTOP_GATE (.A(EMPTY), .B(VCC), .Y(READ_ESTOP_ENABLE));
    OR2 OR2_17 (.A(\AFULLX_I[13] ), .B(\AFULLX_I[14] ), .Y(OR2_17_Y));
    OR2 OR2_44 (.A(\FULLX_I[11] ), .B(\FULLX_I[12] ), .Y(OR2_44_Y));
    OR2 OR2_20 (.A(\FULLX_I[3] ), .B(\FULLX_I[4] ), .Y(OR2_20_Y));
    OR2 OR2_45 (.A(\AEMPTYX_I[13] ), .B(\AEMPTYX_I[14] ), .Y(OR2_45_Y));
    OR2 OR2_41 (.A(OR2_5_Y), .B(OR2_38_Y), .Y(OR2_41_Y));
    FIFO4K18 \FIFOBLOCK[5]  (.AEVAL11(GND), .AEVAL10(GND), .AEVAL9(GND)
        , .AEVAL8(GND), .AEVAL7(GND), .AEVAL6(GND), .AEVAL5(GND), 
        .AEVAL4(GND), .AEVAL3(GND), .AEVAL2(GND), .AEVAL1(GND), 
        .AEVAL0(VCC), .AFVAL11(GND), .AFVAL10(GND), .AFVAL9(GND), 
        .AFVAL8(GND), .AFVAL7(GND), .AFVAL6(GND), .AFVAL5(GND), 
        .AFVAL4(GND), .AFVAL3(GND), .AFVAL2(GND), .AFVAL1(VCC), 
        .AFVAL0(GND), .WD17(GND), .WD16(GND), .WD15(GND), .WD14(GND), 
        .WD13(GND), .WD12(GND), .WD11(GND), .WD10(GND), .WD9(GND), 
        .WD8(GND), .WD7(GND), .WD6(GND), .WD5(GND), .WD4(GND), .WD3(
        GND), .WD2(GND), .WD1(GND), .WD0(DATA[5]), .WW0(GND), .WW1(GND)
        , .WW2(GND), .RW0(GND), .RW1(GND), .RW2(GND), .RPIPE(GND), 
        .WEN(WRITE_ENABLE_I), .REN(READ_ENABLE_I), .WBLK(GND), .RBLK(
        GND), .WCLK(WCLOCK), .RCLK(RCLOCK), .RESET(RESETP), .ESTOP(VCC)
        , .FSTOP(VCC), .RD17(), .RD16(), .RD15(), .RD14(), .RD13(), 
        .RD12(), .RD11(), .RD10(), .RD9(), .RD8(), .RD7(), .RD6(), 
        .RD5(), .RD4(), .RD3(), .RD2(), .RD1(), .RD0(Q[5]), .FULL(
        \FULLX_I[5] ), .AFULL(\AFULLX_I[5] ), .EMPTY(\EMPTYX_I[5] ), 
        .AEMPTY(\AEMPTYX_I[5] ));
    OR2 OR2_42 (.A(OR2_30_Y), .B(OR2_16_Y), .Y(OR2_42_Y));
    OR2 OR2_19 (.A(\AFULLX_I[0] ), .B(\AFULLX_I[1] ), .Y(OR2_19_Y));
    FIFO4K18 \FIFOBLOCK[4]  (.AEVAL11(GND), .AEVAL10(GND), .AEVAL9(GND)
        , .AEVAL8(GND), .AEVAL7(GND), .AEVAL6(GND), .AEVAL5(GND), 
        .AEVAL4(GND), .AEVAL3(GND), .AEVAL2(GND), .AEVAL1(GND), 
        .AEVAL0(VCC), .AFVAL11(GND), .AFVAL10(GND), .AFVAL9(GND), 
        .AFVAL8(GND), .AFVAL7(GND), .AFVAL6(GND), .AFVAL5(GND), 
        .AFVAL4(GND), .AFVAL3(GND), .AFVAL2(GND), .AFVAL1(VCC), 
        .AFVAL0(GND), .WD17(GND), .WD16(GND), .WD15(GND), .WD14(GND), 
        .WD13(GND), .WD12(GND), .WD11(GND), .WD10(GND), .WD9(GND), 
        .WD8(GND), .WD7(GND), .WD6(GND), .WD5(GND), .WD4(GND), .WD3(
        GND), .WD2(GND), .WD1(GND), .WD0(DATA[4]), .WW0(GND), .WW1(GND)
        , .WW2(GND), .RW0(GND), .RW1(GND), .RW2(GND), .RPIPE(GND), 
        .WEN(WRITE_ENABLE_I), .REN(READ_ENABLE_I), .WBLK(GND), .RBLK(
        GND), .WCLK(WCLOCK), .RCLK(RCLOCK), .RESET(RESETP), .ESTOP(VCC)
        , .FSTOP(VCC), .RD17(), .RD16(), .RD15(), .RD14(), .RD13(), 
        .RD12(), .RD11(), .RD10(), .RD9(), .RD8(), .RD7(), .RD6(), 
        .RD5(), .RD4(), .RD3(), .RD2(), .RD1(), .RD0(Q[4]), .FULL(
        \FULLX_I[4] ), .AFULL(\AFULLX_I[4] ), .EMPTY(\EMPTYX_I[4] ), 
        .AEMPTY(\AEMPTYX_I[4] ));
    OR2 OR2_33 (.A(\EMPTYX_I[15] ), .B(\EMPTYX_I[16] ), .Y(OR2_33_Y));
    OR2 OR2_24 (.A(\EMPTYX_I[13] ), .B(\EMPTYX_I[14] ), .Y(OR2_24_Y));
    OR2 OR2_47 (.A(OR2_26_Y), .B(OR2_39_Y), .Y(OR2_47_Y));
    INV WEBUBBLEA (.A(WE), .Y(WEBP));
    NAND2 WRITE_FSTOP_GATE (.A(FULL), .B(VCC), .Y(WRITE_FSTOP_ENABLE));
    OR2 OR2_50 (.A(OR2_3_Y), .B(\AEMPTYX_I[2] ), .Y(OR2_50_Y));
    FIFO4K18 \FIFOBLOCK[7]  (.AEVAL11(GND), .AEVAL10(GND), .AEVAL9(GND)
        , .AEVAL8(GND), .AEVAL7(GND), .AEVAL6(GND), .AEVAL5(GND), 
        .AEVAL4(GND), .AEVAL3(GND), .AEVAL2(GND), .AEVAL1(GND), 
        .AEVAL0(VCC), .AFVAL11(GND), .AFVAL10(GND), .AFVAL9(GND), 
        .AFVAL8(GND), .AFVAL7(GND), .AFVAL6(GND), .AFVAL5(GND), 
        .AFVAL4(GND), .AFVAL3(GND), .AFVAL2(GND), .AFVAL1(VCC), 
        .AFVAL0(GND), .WD17(GND), .WD16(GND), .WD15(GND), .WD14(GND), 
        .WD13(GND), .WD12(GND), .WD11(GND), .WD10(GND), .WD9(GND), 
        .WD8(GND), .WD7(GND), .WD6(GND), .WD5(GND), .WD4(GND), .WD3(
        GND), .WD2(GND), .WD1(GND), .WD0(DATA[7]), .WW0(GND), .WW1(GND)
        , .WW2(GND), .RW0(GND), .RW1(GND), .RW2(GND), .RPIPE(GND), 
        .WEN(WRITE_ENABLE_I), .REN(READ_ENABLE_I), .WBLK(GND), .RBLK(
        GND), .WCLK(WCLOCK), .RCLK(RCLOCK), .RESET(RESETP), .ESTOP(VCC)
        , .FSTOP(VCC), .RD17(), .RD16(), .RD15(), .RD14(), .RD13(), 
        .RD12(), .RD11(), .RD10(), .RD9(), .RD8(), .RD7(), .RD6(), 
        .RD5(), .RD4(), .RD3(), .RD2(), .RD1(), .RD0(Q[7]), .FULL(
        \FULLX_I[7] ), .AFULL(\AFULLX_I[7] ), .EMPTY(\EMPTYX_I[7] ), 
        .AEMPTY(\AEMPTYX_I[7] ));
    OR2 OR2_25 (.A(OR2_32_Y), .B(OR2_28_Y), .Y(OR2_25_Y));
    OR2 OR2_21 (.A(\AEMPTYX_I[11] ), .B(\AEMPTYX_I[12] ), .Y(OR2_21_Y));
    OR2 OR2_22 (.A(\AEMPTYX_I[7] ), .B(\AEMPTYX_I[8] ), .Y(OR2_22_Y));
    OR2 OR2_13 (.A(\FULLX_I[7] ), .B(\FULLX_I[8] ), .Y(OR2_13_Y));
    OR2 OR2_54 (.A(\AFULLX_I[5] ), .B(\AFULLX_I[6] ), .Y(OR2_54_Y));
    OR2 OR2_49 (.A(\FULLX_I[5] ), .B(\FULLX_I[6] ), .Y(OR2_49_Y));
    OR2 OR2_27 (.A(OR2_36_Y), .B(OR2_55_Y), .Y(OR2_27_Y));
    OR2 OR2_0 (.A(OR2_19_Y), .B(\AFULLX_I[2] ), .Y(OR2_0_Y));
    FIFO4K18 \FIFOBLOCK[6]  (.AEVAL11(GND), .AEVAL10(GND), .AEVAL9(GND)
        , .AEVAL8(GND), .AEVAL7(GND), .AEVAL6(GND), .AEVAL5(GND), 
        .AEVAL4(GND), .AEVAL3(GND), .AEVAL2(GND), .AEVAL1(GND), 
        .AEVAL0(VCC), .AFVAL11(GND), .AFVAL10(GND), .AFVAL9(GND), 
        .AFVAL8(GND), .AFVAL7(GND), .AFVAL6(GND), .AFVAL5(GND), 
        .AFVAL4(GND), .AFVAL3(GND), .AFVAL2(GND), .AFVAL1(VCC), 
        .AFVAL0(GND), .WD17(GND), .WD16(GND), .WD15(GND), .WD14(GND), 
        .WD13(GND), .WD12(GND), .WD11(GND), .WD10(GND), .WD9(GND), 
        .WD8(GND), .WD7(GND), .WD6(GND), .WD5(GND), .WD4(GND), .WD3(
        GND), .WD2(GND), .WD1(GND), .WD0(DATA[6]), .WW0(GND), .WW1(GND)
        , .WW2(GND), .RW0(GND), .RW1(GND), .RW2(GND), .RPIPE(GND), 
        .WEN(WRITE_ENABLE_I), .REN(READ_ENABLE_I), .WBLK(GND), .RBLK(
        GND), .WCLK(WCLOCK), .RCLK(RCLOCK), .RESET(RESETP), .ESTOP(VCC)
        , .FSTOP(VCC), .RD17(), .RD16(), .RD15(), .RD14(), .RD13(), 
        .RD12(), .RD11(), .RD10(), .RD9(), .RD8(), .RD7(), .RD6(), 
        .RD5(), .RD4(), .RD3(), .RD2(), .RD1(), .RD0(Q[6]), .FULL(
        \FULLX_I[6] ), .AFULL(\AFULLX_I[6] ), .EMPTY(\EMPTYX_I[6] ), 
        .AEMPTY(\AEMPTYX_I[6] ));
    FIFO4K18 \FIFOBLOCK[9]  (.AEVAL11(GND), .AEVAL10(GND), .AEVAL9(GND)
        , .AEVAL8(GND), .AEVAL7(GND), .AEVAL6(GND), .AEVAL5(GND), 
        .AEVAL4(GND), .AEVAL3(GND), .AEVAL2(GND), .AEVAL1(GND), 
        .AEVAL0(VCC), .AFVAL11(GND), .AFVAL10(GND), .AFVAL9(GND), 
        .AFVAL8(GND), .AFVAL7(GND), .AFVAL6(GND), .AFVAL5(GND), 
        .AFVAL4(GND), .AFVAL3(GND), .AFVAL2(GND), .AFVAL1(VCC), 
        .AFVAL0(GND), .WD17(GND), .WD16(GND), .WD15(GND), .WD14(GND), 
        .WD13(GND), .WD12(GND), .WD11(GND), .WD10(GND), .WD9(GND), 
        .WD8(GND), .WD7(GND), .WD6(GND), .WD5(GND), .WD4(GND), .WD3(
        GND), .WD2(GND), .WD1(GND), .WD0(DATA[9]), .WW0(GND), .WW1(GND)
        , .WW2(GND), .RW0(GND), .RW1(GND), .RW2(GND), .RPIPE(GND), 
        .WEN(WRITE_ENABLE_I), .REN(READ_ENABLE_I), .WBLK(GND), .RBLK(
        GND), .WCLK(WCLOCK), .RCLK(RCLOCK), .RESET(RESETP), .ESTOP(VCC)
        , .FSTOP(VCC), .RD17(), .RD16(), .RD15(), .RD14(), .RD13(), 
        .RD12(), .RD11(), .RD10(), .RD9(), .RD8(), .RD7(), .RD6(), 
        .RD5(), .RD4(), .RD3(), .RD2(), .RD1(), .RD0(Q[9]), .FULL(
        \FULLX_I[9] ), .AFULL(\AFULLX_I[9] ), .EMPTY(\EMPTYX_I[9] ), 
        .AEMPTY(\AEMPTYX_I[9] ));
    OR2 OR2_55 (.A(\AFULLX_I[11] ), .B(\AFULLX_I[12] ), .Y(OR2_55_Y));
    OR2 OR2_51 (.A(\AFULLX_I[15] ), .B(\AFULLX_I[16] ), .Y(OR2_51_Y));
    OR2 OR2_8 (.A(\AEMPTYX_I[3] ), .B(\AEMPTYX_I[4] ), .Y(OR2_8_Y));
    AND2 READ_AND (.A(RE), .B(READ_ESTOP_ENABLE), .Y(READ_ENABLE_I));
    OR2 OR2_52 (.A(OR2_47_Y), .B(OR2_34_Y), .Y(OR2_52_Y));
    OR2 OR2_7 (.A(\EMPTYX_I[5] ), .B(\EMPTYX_I[6] ), .Y(OR2_7_Y));
    FIFO4K18 \FIFOBLOCK[3]  (.AEVAL11(GND), .AEVAL10(GND), .AEVAL9(GND)
        , .AEVAL8(GND), .AEVAL7(GND), .AEVAL6(GND), .AEVAL5(GND), 
        .AEVAL4(GND), .AEVAL3(GND), .AEVAL2(GND), .AEVAL1(GND), 
        .AEVAL0(VCC), .AFVAL11(GND), .AFVAL10(GND), .AFVAL9(GND), 
        .AFVAL8(GND), .AFVAL7(GND), .AFVAL6(GND), .AFVAL5(GND), 
        .AFVAL4(GND), .AFVAL3(GND), .AFVAL2(GND), .AFVAL1(VCC), 
        .AFVAL0(GND), .WD17(GND), .WD16(GND), .WD15(GND), .WD14(GND), 
        .WD13(GND), .WD12(GND), .WD11(GND), .WD10(GND), .WD9(GND), 
        .WD8(GND), .WD7(GND), .WD6(GND), .WD5(GND), .WD4(GND), .WD3(
        GND), .WD2(GND), .WD1(GND), .WD0(DATA[3]), .WW0(GND), .WW1(GND)
        , .WW2(GND), .RW0(GND), .RW1(GND), .RW2(GND), .RPIPE(GND), 
        .WEN(WRITE_ENABLE_I), .REN(READ_ENABLE_I), .WBLK(GND), .RBLK(
        GND), .WCLK(WCLOCK), .RCLK(RCLOCK), .RESET(RESETP), .ESTOP(VCC)
        , .FSTOP(VCC), .RD17(), .RD16(), .RD15(), .RD14(), .RD13(), 
        .RD12(), .RD11(), .RD10(), .RD9(), .RD8(), .RD7(), .RD6(), 
        .RD5(), .RD4(), .RD3(), .RD2(), .RD1(), .RD0(Q[3]), .FULL(
        \FULLX_I[3] ), .AFULL(\AFULLX_I[3] ), .EMPTY(\EMPTYX_I[3] ), 
        .AEMPTY(\AEMPTYX_I[3] ));
    OR2 OR2_EMPTY (.A(OR2_59_Y), .B(OR2_52_Y), .Y(EMPTY));
    OR2 OR2_29 (.A(OR2_49_Y), .B(OR2_13_Y), .Y(OR2_29_Y));
    OR2 OR2_57 (.A(\EMPTYX_I[3] ), .B(\EMPTYX_I[4] ), .Y(OR2_57_Y));
    OR2 OR2_43 (.A(OR2_7_Y), .B(OR2_40_Y), .Y(OR2_43_Y));
    FIFO4K18 \FIFOBLOCK[0]  (.AEVAL11(GND), .AEVAL10(GND), .AEVAL9(GND)
        , .AEVAL8(GND), .AEVAL7(GND), .AEVAL6(GND), .AEVAL5(GND), 
        .AEVAL4(GND), .AEVAL3(GND), .AEVAL2(GND), .AEVAL1(GND), 
        .AEVAL0(VCC), .AFVAL11(GND), .AFVAL10(GND), .AFVAL9(GND), 
        .AFVAL8(GND), .AFVAL7(GND), .AFVAL6(GND), .AFVAL5(GND), 
        .AFVAL4(GND), .AFVAL3(GND), .AFVAL2(GND), .AFVAL1(VCC), 
        .AFVAL0(GND), .WD17(GND), .WD16(GND), .WD15(GND), .WD14(GND), 
        .WD13(GND), .WD12(GND), .WD11(GND), .WD10(GND), .WD9(GND), 
        .WD8(GND), .WD7(GND), .WD6(GND), .WD5(GND), .WD4(GND), .WD3(
        GND), .WD2(GND), .WD1(GND), .WD0(DATA[0]), .WW0(GND), .WW1(GND)
        , .WW2(GND), .RW0(GND), .RW1(GND), .RW2(GND), .RPIPE(GND), 
        .WEN(WRITE_ENABLE_I), .REN(READ_ENABLE_I), .WBLK(GND), .RBLK(
        GND), .WCLK(WCLOCK), .RCLK(RCLOCK), .RESET(RESETP), .ESTOP(VCC)
        , .FSTOP(VCC), .RD17(), .RD16(), .RD15(), .RD14(), .RD13(), 
        .RD12(), .RD11(), .RD10(), .RD9(), .RD8(), .RD7(), .RD6(), 
        .RD5(), .RD4(), .RD3(), .RD2(), .RD1(), .RD0(Q[0]), .FULL(
        \FULLX_I[0] ), .AFULL(\AFULLX_I[0] ), .EMPTY(\EMPTYX_I[0] ), 
        .AEMPTY(\AEMPTYX_I[0] ));
    FIFO4K18 \FIFOBLOCK[12]  (.AEVAL11(GND), .AEVAL10(GND), .AEVAL9(
        GND), .AEVAL8(GND), .AEVAL7(GND), .AEVAL6(GND), .AEVAL5(GND), 
        .AEVAL4(GND), .AEVAL3(GND), .AEVAL2(GND), .AEVAL1(GND), 
        .AEVAL0(VCC), .AFVAL11(GND), .AFVAL10(GND), .AFVAL9(GND), 
        .AFVAL8(GND), .AFVAL7(GND), .AFVAL6(GND), .AFVAL5(GND), 
        .AFVAL4(GND), .AFVAL3(GND), .AFVAL2(GND), .AFVAL1(VCC), 
        .AFVAL0(GND), .WD17(GND), .WD16(GND), .WD15(GND), .WD14(GND), 
        .WD13(GND), .WD12(GND), .WD11(GND), .WD10(GND), .WD9(GND), 
        .WD8(GND), .WD7(GND), .WD6(GND), .WD5(GND), .WD4(GND), .WD3(
        GND), .WD2(GND), .WD1(GND), .WD0(DATA[12]), .WW0(GND), .WW1(
        GND), .WW2(GND), .RW0(GND), .RW1(GND), .RW2(GND), .RPIPE(GND), 
        .WEN(WRITE_ENABLE_I), .REN(READ_ENABLE_I), .WBLK(GND), .RBLK(
        GND), .WCLK(WCLOCK), .RCLK(RCLOCK), .RESET(RESETP), .ESTOP(VCC)
        , .FSTOP(VCC), .RD17(), .RD16(), .RD15(), .RD14(), .RD13(), 
        .RD12(), .RD11(), .RD10(), .RD9(), .RD8(), .RD7(), .RD6(), 
        .RD5(), .RD4(), .RD3(), .RD2(), .RD1(), .RD0(Q[12]), .FULL(
        \FULLX_I[12] ), .AFULL(\AFULLX_I[12] ), .EMPTY(\EMPTYX_I[12] ), 
        .AEMPTY(\AEMPTYX_I[12] ));
    FIFO4K18 \FIFOBLOCK[15]  (.AEVAL11(GND), .AEVAL10(GND), .AEVAL9(
        GND), .AEVAL8(GND), .AEVAL7(GND), .AEVAL6(GND), .AEVAL5(GND), 
        .AEVAL4(GND), .AEVAL3(GND), .AEVAL2(GND), .AEVAL1(GND), 
        .AEVAL0(VCC), .AFVAL11(GND), .AFVAL10(GND), .AFVAL9(GND), 
        .AFVAL8(GND), .AFVAL7(GND), .AFVAL6(GND), .AFVAL5(GND), 
        .AFVAL4(GND), .AFVAL3(GND), .AFVAL2(GND), .AFVAL1(VCC), 
        .AFVAL0(GND), .WD17(GND), .WD16(GND), .WD15(GND), .WD14(GND), 
        .WD13(GND), .WD12(GND), .WD11(GND), .WD10(GND), .WD9(GND), 
        .WD8(GND), .WD7(GND), .WD6(GND), .WD5(GND), .WD4(GND), .WD3(
        GND), .WD2(GND), .WD1(GND), .WD0(DATA[15]), .WW0(GND), .WW1(
        GND), .WW2(GND), .RW0(GND), .RW1(GND), .RW2(GND), .RPIPE(GND), 
        .WEN(WRITE_ENABLE_I), .REN(READ_ENABLE_I), .WBLK(GND), .RBLK(
        GND), .WCLK(WCLOCK), .RCLK(RCLOCK), .RESET(RESETP), .ESTOP(VCC)
        , .FSTOP(VCC), .RD17(), .RD16(), .RD15(), .RD14(), .RD13(), 
        .RD12(), .RD11(), .RD10(), .RD9(), .RD8(), .RD7(), .RD6(), 
        .RD5(), .RD4(), .RD3(), .RD2(), .RD1(), .RD0(Q[15]), .FULL(
        \FULLX_I[15] ), .AFULL(\AFULLX_I[15] ), .EMPTY(\EMPTYX_I[15] ), 
        .AEMPTY(\AEMPTYX_I[15] ));
    OR2 OR2_36 (.A(\AFULLX_I[9] ), .B(\AFULLX_I[10] ), .Y(OR2_36_Y));
    OR2 OR2_6 (.A(\FULLX_I[13] ), .B(\FULLX_I[14] ), .Y(OR2_6_Y));
    OR2 OR2_3 (.A(\AEMPTYX_I[0] ), .B(\AEMPTYX_I[1] ), .Y(OR2_3_Y));
    OR2 OR2_59 (.A(OR2_37_Y), .B(OR2_43_Y), .Y(OR2_59_Y));
    OR2 OR2_23 (.A(\AEMPTYX_I[5] ), .B(\AEMPTYX_I[6] ), .Y(OR2_23_Y));
    OR2 OR2_16 (.A(OR2_54_Y), .B(OR2_15_Y), .Y(OR2_16_Y));
    OR2 OR2_9 (.A(\AFULLX_I[3] ), .B(\AFULLX_I[4] ), .Y(OR2_9_Y));
    FIFO4K18 \FIFOBLOCK[16]  (.AEVAL11(GND), .AEVAL10(GND), .AEVAL9(
        GND), .AEVAL8(GND), .AEVAL7(GND), .AEVAL6(GND), .AEVAL5(GND), 
        .AEVAL4(GND), .AEVAL3(GND), .AEVAL2(GND), .AEVAL1(GND), 
        .AEVAL0(VCC), .AFVAL11(GND), .AFVAL10(GND), .AFVAL9(GND), 
        .AFVAL8(GND), .AFVAL7(GND), .AFVAL6(GND), .AFVAL5(GND), 
        .AFVAL4(GND), .AFVAL3(GND), .AFVAL2(GND), .AFVAL1(VCC), 
        .AFVAL0(GND), .WD17(GND), .WD16(GND), .WD15(GND), .WD14(GND), 
        .WD13(GND), .WD12(GND), .WD11(GND), .WD10(GND), .WD9(GND), 
        .WD8(GND), .WD7(GND), .WD6(GND), .WD5(GND), .WD4(GND), .WD3(
        GND), .WD2(GND), .WD1(GND), .WD0(DATA[16]), .WW0(GND), .WW1(
        GND), .WW2(GND), .RW0(GND), .RW1(GND), .RW2(GND), .RPIPE(GND), 
        .WEN(WRITE_ENABLE_I), .REN(READ_ENABLE_I), .WBLK(GND), .RBLK(
        GND), .WCLK(WCLOCK), .RCLK(RCLOCK), .RESET(RESETP), .ESTOP(VCC)
        , .FSTOP(VCC), .RD17(), .RD16(), .RD15(), .RD14(), .RD13(), 
        .RD12(), .RD11(), .RD10(), .RD9(), .RD8(), .RD7(), .RD6(), 
        .RD5(), .RD4(), .RD3(), .RD2(), .RD1(), .RD0(Q[16]), .FULL(
        \FULLX_I[16] ), .AFULL(\AFULLX_I[16] ), .EMPTY(\EMPTYX_I[16] ), 
        .AEMPTY(\AEMPTYX_I[16] ));
    FIFO4K18 \FIFOBLOCK[8]  (.AEVAL11(GND), .AEVAL10(GND), .AEVAL9(GND)
        , .AEVAL8(GND), .AEVAL7(GND), .AEVAL6(GND), .AEVAL5(GND), 
        .AEVAL4(GND), .AEVAL3(GND), .AEVAL2(GND), .AEVAL1(GND), 
        .AEVAL0(VCC), .AFVAL11(GND), .AFVAL10(GND), .AFVAL9(GND), 
        .AFVAL8(GND), .AFVAL7(GND), .AFVAL6(GND), .AFVAL5(GND), 
        .AFVAL4(GND), .AFVAL3(GND), .AFVAL2(GND), .AFVAL1(VCC), 
        .AFVAL0(GND), .WD17(GND), .WD16(GND), .WD15(GND), .WD14(GND), 
        .WD13(GND), .WD12(GND), .WD11(GND), .WD10(GND), .WD9(GND), 
        .WD8(GND), .WD7(GND), .WD6(GND), .WD5(GND), .WD4(GND), .WD3(
        GND), .WD2(GND), .WD1(GND), .WD0(DATA[8]), .WW0(GND), .WW1(GND)
        , .WW2(GND), .RW0(GND), .RW1(GND), .RW2(GND), .RPIPE(GND), 
        .WEN(WRITE_ENABLE_I), .REN(READ_ENABLE_I), .WBLK(GND), .RBLK(
        GND), .WCLK(WCLOCK), .RCLK(RCLOCK), .RESET(RESETP), .ESTOP(VCC)
        , .FSTOP(VCC), .RD17(), .RD16(), .RD15(), .RD14(), .RD13(), 
        .RD12(), .RD11(), .RD10(), .RD9(), .RD8(), .RD7(), .RD6(), 
        .RD5(), .RD4(), .RD3(), .RD2(), .RD1(), .RD0(Q[8]), .FULL(
        \FULLX_I[8] ), .AFULL(\AFULLX_I[8] ), .EMPTY(\EMPTYX_I[8] ), 
        .AEMPTY(\AEMPTYX_I[8] ));
    OR2 OR2_38 (.A(OR2_23_Y), .B(OR2_22_Y), .Y(OR2_38_Y));
    OR2 OR2_AEMPTY (.A(OR2_41_Y), .B(OR2_1_Y), .Y(AEMPTY));
    OR2 OR2_1 (.A(OR2_46_Y), .B(OR2_12_Y), .Y(OR2_1_Y));
    FIFO4K18 \FIFOBLOCK[14]  (.AEVAL11(GND), .AEVAL10(GND), .AEVAL9(
        GND), .AEVAL8(GND), .AEVAL7(GND), .AEVAL6(GND), .AEVAL5(GND), 
        .AEVAL4(GND), .AEVAL3(GND), .AEVAL2(GND), .AEVAL1(GND), 
        .AEVAL0(VCC), .AFVAL11(GND), .AFVAL10(GND), .AFVAL9(GND), 
        .AFVAL8(GND), .AFVAL7(GND), .AFVAL6(GND), .AFVAL5(GND), 
        .AFVAL4(GND), .AFVAL3(GND), .AFVAL2(GND), .AFVAL1(VCC), 
        .AFVAL0(GND), .WD17(GND), .WD16(GND), .WD15(GND), .WD14(GND), 
        .WD13(GND), .WD12(GND), .WD11(GND), .WD10(GND), .WD9(GND), 
        .WD8(GND), .WD7(GND), .WD6(GND), .WD5(GND), .WD4(GND), .WD3(
        GND), .WD2(GND), .WD1(GND), .WD0(DATA[14]), .WW0(GND), .WW1(
        GND), .WW2(GND), .RW0(GND), .RW1(GND), .RW2(GND), .RPIPE(GND), 
        .WEN(WRITE_ENABLE_I), .REN(READ_ENABLE_I), .WBLK(GND), .RBLK(
        GND), .WCLK(WCLOCK), .RCLK(RCLOCK), .RESET(RESETP), .ESTOP(VCC)
        , .FSTOP(VCC), .RD17(), .RD16(), .RD15(), .RD14(), .RD13(), 
        .RD12(), .RD11(), .RD10(), .RD9(), .RD8(), .RD7(), .RD6(), 
        .RD5(), .RD4(), .RD3(), .RD2(), .RD1(), .RD0(Q[14]), .FULL(
        \FULLX_I[14] ), .AFULL(\AFULLX_I[14] ), .EMPTY(\EMPTYX_I[14] ), 
        .AEMPTY(\AEMPTYX_I[14] ));
    OR2 OR2_53 (.A(OR2_58_Y), .B(OR2_29_Y), .Y(OR2_53_Y));
    OR2 OR2_46 (.A(OR2_10_Y), .B(OR2_21_Y), .Y(OR2_46_Y));
    OR2 OR2_18 (.A(OR2_27_Y), .B(OR2_56_Y), .Y(OR2_18_Y));
    OR2 OR2_4 (.A(\FULLX_I[9] ), .B(\FULLX_I[10] ), .Y(OR2_4_Y));
    FIFO4K18 \FIFOBLOCK[1]  (.AEVAL11(GND), .AEVAL10(GND), .AEVAL9(GND)
        , .AEVAL8(GND), .AEVAL7(GND), .AEVAL6(GND), .AEVAL5(GND), 
        .AEVAL4(GND), .AEVAL3(GND), .AEVAL2(GND), .AEVAL1(GND), 
        .AEVAL0(VCC), .AFVAL11(GND), .AFVAL10(GND), .AFVAL9(GND), 
        .AFVAL8(GND), .AFVAL7(GND), .AFVAL6(GND), .AFVAL5(GND), 
        .AFVAL4(GND), .AFVAL3(GND), .AFVAL2(GND), .AFVAL1(VCC), 
        .AFVAL0(GND), .WD17(GND), .WD16(GND), .WD15(GND), .WD14(GND), 
        .WD13(GND), .WD12(GND), .WD11(GND), .WD10(GND), .WD9(GND), 
        .WD8(GND), .WD7(GND), .WD6(GND), .WD5(GND), .WD4(GND), .WD3(
        GND), .WD2(GND), .WD1(GND), .WD0(DATA[1]), .WW0(GND), .WW1(GND)
        , .WW2(GND), .RW0(GND), .RW1(GND), .RW2(GND), .RPIPE(GND), 
        .WEN(WRITE_ENABLE_I), .REN(READ_ENABLE_I), .WBLK(GND), .RBLK(
        GND), .WCLK(WCLOCK), .RCLK(RCLOCK), .RESET(RESETP), .ESTOP(VCC)
        , .FSTOP(VCC), .RD17(), .RD16(), .RD15(), .RD14(), .RD13(), 
        .RD12(), .RD11(), .RD10(), .RD9(), .RD8(), .RD7(), .RD6(), 
        .RD5(), .RD4(), .RD3(), .RD2(), .RD1(), .RD0(Q[1]), .FULL(
        \FULLX_I[1] ), .AFULL(\AFULLX_I[1] ), .EMPTY(\EMPTYX_I[1] ), 
        .AEMPTY(\AEMPTYX_I[1] ));
    OR2 OR2_30 (.A(OR2_0_Y), .B(OR2_9_Y), .Y(OR2_30_Y));
    OR2 OR2_26 (.A(\EMPTYX_I[9] ), .B(\EMPTYX_I[10] ), .Y(OR2_26_Y));
    OR2 OR2_48 (.A(\EMPTYX_I[0] ), .B(\EMPTYX_I[1] ), .Y(OR2_48_Y));
    OR2 OR2_34 (.A(OR2_24_Y), .B(OR2_33_Y), .Y(OR2_34_Y));
    NAND2A WRITE_AND (.A(WEBP), .B(WRITE_FSTOP_ENABLE), .Y(
        WRITE_ENABLE_I));
    OR2 OR2_2 (.A(\FULLX_I[15] ), .B(\FULLX_I[16] ), .Y(OR2_2_Y));
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
// WDEPTH:4096
// RDEPTH:4096
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

