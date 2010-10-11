/* Verilog netlist generated by SCUBA Diamond_1.0_Production (529) */
/* Module Version: 5.2 */
/* /usr/local/diamond/1.0/ispfpga/bin/lin/scuba -w -n pll -lang verilog -synth synplify -arch mg5a00 -type pll -fin 100 -phase_cntl STATIC -fclkop 400 -fclkop_tol 0.0 -fb_mode INTERNAL -noclkos -fclkok 25 -fclkok_tol 0.0 -norst -noclkok2 -e  */
/* Mon Oct  4 20:27:16 2010 */


`timescale 1 ns / 1 ps
module pll (CLK, CLKOP, CLKOK, LOCK)/* synthesis syn_noprune=1 */;// exemplar attribute pll dont_touch true 
    input wire CLK;
    output wire CLKOP;
    output wire CLKOK;
    output wire LOCK;

    wire CLKOP_t;
    wire CLKFB_t;
    wire scuba_vlo;

    VLO scuba_vlo_inst (.Z(scuba_vlo));

    // synopsys translate_off
    defparam PLLInst_0.CLKOK_BYPASS = "DISABLED" ;
    defparam PLLInst_0.CLKOS_BYPASS = "DISABLED" ;
    defparam PLLInst_0.CLKOP_BYPASS = "DISABLED" ;
    defparam PLLInst_0.PHASE_CNTL = "STATIC" ;
    defparam PLLInst_0.DUTY = 8 ;
    defparam PLLInst_0.PHASEADJ = "0.0" ;
    defparam PLLInst_0.CLKOK_DIV = 16 ;
    defparam PLLInst_0.CLKOP_DIV = 2 ;
    defparam PLLInst_0.CLKFB_DIV = 4 ;
    defparam PLLInst_0.CLKI_DIV = 1 ;
    // synopsys translate_on
    EPLLD1 PLLInst_0 (.CLKI(CLK), .CLKFB(CLKFB_t), .RST(scuba_vlo), .RSTK(scuba_vlo), 
        .DPAMODE(scuba_vlo), .DRPAI3(scuba_vlo), .DRPAI2(scuba_vlo), .DRPAI1(scuba_vlo), 
        .DRPAI0(scuba_vlo), .DFPAI3(scuba_vlo), .DFPAI2(scuba_vlo), .DFPAI1(scuba_vlo), 
        .DFPAI0(scuba_vlo), .PWD(scuba_vlo), .CLKOP(CLKOP_t), .CLKOS(), 
        .CLKOK(CLKOK), .LOCK(LOCK), .CLKINTFB(CLKFB_t))
             /* synthesis CLKOK_BYPASS="DISABLED" */
             /* synthesis CLKOS_BYPASS="DISABLED" */
             /* synthesis FREQUENCY_PIN_CLKOP="400.000000" */
             /* synthesis CLKOP_BYPASS="DISABLED" */
             /* synthesis PHASE_CNTL="STATIC" */
             /* synthesis DUTY="8" */
             /* synthesis PHASEADJ="0.0" */
             /* synthesis FREQUENCY_PIN_CLKI="100.000000" */
             /* synthesis FREQUENCY_PIN_CLKOK="25.000000" */
             /* synthesis CLKOK_DIV="16" */
             /* synthesis CLKOP_DIV="2" */
             /* synthesis CLKFB_DIV="4" */
             /* synthesis CLKI_DIV="1" */
             /* synthesis FIN="100.000000" */;

    assign CLKOP = CLKOP_t;


    // exemplar begin
    // exemplar attribute PLLInst_0 CLKOK_BYPASS DISABLED
    // exemplar attribute PLLInst_0 CLKOS_BYPASS DISABLED
    // exemplar attribute PLLInst_0 FREQUENCY_PIN_CLKOP 400.000000
    // exemplar attribute PLLInst_0 CLKOP_BYPASS DISABLED
    // exemplar attribute PLLInst_0 PHASE_CNTL STATIC
    // exemplar attribute PLLInst_0 DUTY 8
    // exemplar attribute PLLInst_0 PHASEADJ 0.0
    // exemplar attribute PLLInst_0 FREQUENCY_PIN_CLKI 100.000000
    // exemplar attribute PLLInst_0 FREQUENCY_PIN_CLKOK 25.000000
    // exemplar attribute PLLInst_0 CLKOK_DIV 16
    // exemplar attribute PLLInst_0 CLKOP_DIV 2
    // exemplar attribute PLLInst_0 CLKFB_DIV 4
    // exemplar attribute PLLInst_0 CLKI_DIV 1
    // exemplar attribute PLLInst_0 FIN 100.000000
    // exemplar end

endmodule