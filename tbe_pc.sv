`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/24/2025 02:41:50 PM
// Design Name: 
// Module Name: tb_pc
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

module tb_pc;
    logic clk;
    logic reset;
    logic [31:0] pc;
    logic [31:0] next_pc;

    //connecting pc module with testbench
    pc dut (
        .clk(clk),
        .reset(reset),
        .next_pc(next_pc),
        .pc(pc)
    );

    //0 to 5 to 10 to 15
    // Clock: toggles every 5ns → 10ns period
    always #5 clk = ~clk;

    //initializing variables
    initial begin
        clk = 0;
        reset = 1;
        next_pc = 32'd0;

        // Hold reset for 2 cycles
        #20;
        reset = 0;
        //repeaat 5 times
      //pc chnages only at rising edge and takes on value of next_pc
        repeat (5) begin
            next_pc = pc + 4;
            #10;
        end

        $finish;
    end
endmodule
