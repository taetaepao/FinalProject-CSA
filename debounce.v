`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/05/2024 03:28:44 AM
// Design Name: 
// Module Name: debounce
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


module debounce (
    input wire clk, reset,
    input wire btn,
    output reg btn_out
);
    reg [19:0] count;
    reg btn_sync, btn_prev;

    always @(posedge clk or posedge reset) begin
        if (reset) begin
            count <= 0;
            btn_sync <= 0;
            btn_prev <= 0;
            btn_out <= 0;
        end else begin
            btn_sync <= btn;
            if (btn_sync && !btn_prev) begin
                count <= 0;
            end else if (count == 20'd999999) begin
                btn_out <= btn_sync;
            end else begin
                count <= count + 1;
            end
            btn_prev <= btn_sync;
        end
    end
endmodule

