/*
 * Copyright (c) 2013, The DDK Project
 *    Dmitry Nedospasov <dmitry at nedos dot net>
 *    Thorsten Schroeder <ths at modzero dot ch>
 *
 * All rights reserved.
 *
 * This file is part of Die Datenkrake (DDK).
 * 
 * Die Datenkrake is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 2 of the License, or
 * (at your option) any later version.

 * Die Datenkrake is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 * 
 * You should have received a copy of the GNU General Public License
 * along with Die Datenkrake.  If not, see <http://www.gnu.org/licenses/>.
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


`define CH1_BASE				4'h0	// Address 0x0X
`define CH2_BASE				4'h1	// Address 0x1X
`define CH3_BASE				4'h2	// Address 0x2X
`define CH4_BASE				4'h3	// Address 0x3X
`define CH5_BASE				4'h4	// Address 0x4X
`define CH6_BASE				4'h5	// Address 0x5X
`define CH7_BASE				4'h6	// Address 0x6X
`define CH8_BASE				4'h7	// Address 0x7X
`define CLKA_BASE				4'h8	// Address 0x8X
`define CLKB_BASE				4'h9	// Address 0x9X
`define CLKC_BASE				4'hA	// Address 0xAX
`define CLKD_BASE				4'hB	// Address 0xBX

/*************************
  Krake Port Definitions
*************************/

`define PORT_STATUS			4'h0	// (r/w) Port status
`define PORT_CONF				4'h1	// (r/w) Peripheral configuration register
`define PORT_PIN0_CONF	4'h2	// (r/w) Output clocks
`define PORT_PIN1_CONF	4'h3	// (r/w) Output clocks
`define PORT_PIN2_CONF	4'h4	// (r/w) Output clocks
`define PORT_PIN3_CONF	4'h5	// (r/w) Output clocks
`define PORT_PIN4_CONF	4'h6	// (r/w) Output clocks
`define PORT_PIN5_CONF	4'h7	// (r/w) Output clocks

/********************
  CLK Configuration
********************/

`define CLK_GEN_STATUS	4'h0	// (r/w) Frequency generator status
`define CLK_GEN_DIV			4'h1	// (r/w) Frequency generator period
