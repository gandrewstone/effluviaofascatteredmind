`timescale 1 ns / 10 ps

// This design is meant to capture the boilerplate code and pin definitions needed to use the Lattice XP2 Brevia board.
// Copyright 2010 Andew Stone
// You may use this project but please keep the above copyright intact.  You may also add your own copyright above this one.

// Comment out pins that you are not using, or the system will not be pleased that you have not assigned them a value
module brevia(
                        input         clk_in,    // Input clock 50 mhz (board has an oscillator, not just a crystal)
                        input         rst_n,     // Reset is active if 0
                        input   [7:0]  sw,       // switches sw[0 thru 3] = DIP 4,3,2,1. SW[4 thru 7] = push button 3-6
                        output reg [7:0]  led,
						
						// IO headers.  Each pin could be either input or output.          
						inout [41:0] j4,        // Actually only 30 of these are IOs.  The rest are Vcc 3.3volts (1,3),GND (13,14,25,26,37,38), and reset (39).  But I set it up with 11 wasted wires so the index exactly matches the pin #.
						inout [11:0] j24        // Only 8 IOs.  Pin 2 is PWR, 9 is GND.
//                        inout  [7:0]  sram_data,
//                        output reg [16:0] sram_addr,
//                        output reg      sram_cen,
//                        output reg       sram_oen,
//                        output reg       sram_wen,
//                        input         uart_rx,
//                        output reg       uart_tx,
//                        output reg       spi_sclk,
//                        output reg       spi_csn,
//                        output reg       spi_mosi,
//                        input         spi_miso,
//                        output reg       wn,
//                        output reg       holdn
  );
   
   
 reg[24:0] cnt;
 wire clk400,clk25;
 wire clkOk;
 reg resetBuf;
 reg reset;  // The reset button (after some cleaning that syncs it to the clock).  High means IN RESET
 
 reg high,low;
 
 wire async_reset = rst_n & clkOk; // when we go out of reset AND the PLL is ready...
 
 // Use the general purpose IO pins:
 
 // The j4 and j24 are defined as "wires".  They do not hold values.
 // These commands connect the output of registers that you define to the particular pin that you choose.
 // If the pin is to be used as input, assign it to "high impedence" (1'hZ) here.
 assign j4[3] = high;
 assign j4[4] = low;
 
 // Push the 50 mhz clock into a PLL and have it generate 400 and 25 mhz clocks.
 // You can modify the generated frequencies by clicking on the pll.ipx file in Diamond
 // modifying values in the GUI and regenerating.
 pll pll400 (.CLK(clk_in), .CLKOP(clk400), .CLKOK(clk25), .LOCK(clkOk)); 
 
 // This logic buffers the reset and synchronizes it against the clock
 // It is important to sync it against the clock so that logic that triggers
 // on reset has the complete clock cycle to work.
 always@(posedge clk400 or negedge async_reset) begin
   if (!async_reset) begin
     resetBuf <= 1;
	 reset <= 1;
   end
   else begin
     resetBuf <= 0;
	 reset <= resetBuf;
   end
	 
 end 
  
 
 always@(posedge clk400) begin
   if (reset) begin
     high <= 1;
	 low <= 0;
     //sram_data <=0;
	 //sram_addr <=0;
	 //sram_cen <=0;
	 //sram_oen <=0;
	 //sram_wen <=0;
	 //uart_tx <= 0;
	 //spi_sclk <=0;
	 //spi_csn <=0;
	 //spi_mosi <=0;
	 //wn <=0;
	 //holdn <=0;
     led <= 8'hFF;
	 cnt <= 8'h00;
   end
   else begin
     //led <= 8'h55;
     cnt <= cnt+1;
	 if (sw[4]==0) begin  // Reset the LED count when the button is pushed
	   led <= 8'hff;
	   end
	 else if (sw[3:0] == 0) begin  // If no DIP switch is set just blink a led to say were are ready
	   led[7] <= cnt[23];
	   led[6:0] <= 0;
	   end
     else if (cnt==0) begin  // If there are DIP switches set, then count by the value in the DIP switches
       led <= led+sw[3:0];
	   end

	 
   end
 end
   
endmodule
