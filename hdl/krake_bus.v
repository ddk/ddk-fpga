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
 * Module: krake_bus
 * Description: This module connects the external parallel bus to the core.
 */

module  krake_bus(
      input wire         clk_i,    // Clock
      input wire         rst_i,    // Reset
      input wire [15:0]  data,     // External data bus
      input wire         data_clk, // External data bus clk
      input wire         we,       // Write Enable
      output reg         stb_o,    // WB STB_O
      output reg [7:0]   adr_o,    // WB ADR_O
      output reg [7:0]   dat_o,    // WB DAT_O
      output reg         we_o);    // WB WE_O

reg  clean; // Store the previous clk state
reg  dirty; // Store the previous clk state

// Simply synchronize the inputs to the system clock
always  @ (posedge clk_i)
begin
  stb_o <= 1'b0;
  dirty <= data_clk;
  clean <= dirty;
  we_o <= we; // Write Enable
  adr_o <= data[15:8]; // 8-bit address
  dat_o <= data[7:0]; // 8-bit data

  // Wait for the clock to flip
  if(clean ^ dirty)
    stb_o <= 1'b1;
end

endmodule
