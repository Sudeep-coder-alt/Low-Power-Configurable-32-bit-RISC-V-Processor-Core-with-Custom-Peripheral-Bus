`timescale 1ns/1ps

module alu_tb;

    reg  [31:0] a;
    reg  [31:0] b;
    reg  [3:0]  alu_control;

    wire [31:0] result;
    wire        zero;

    // Instantiate ALU
    alu dut (
        .a(a),
        .b(b),
        .alu_control(alu_control),
        .result(result),
        .zero(zero)
    );

    initial begin

        // Create waveform
        $dumpfile("sim/alu.vcd");
        $dumpvars(0, alu_tb);

        // ADD
        a = 32'd10;
        b = 32'd5;
        alu_control = 4'b0000;
        #10;
        $display("ADD: %d + %d = %d", a, b, result);

        // SUB
        alu_control = 4'b0001;
        #10;
        $display("SUB: %d - %d = %d", a, b, result);

        // AND
        a = 32'hFF00FF00;
        b = 32'h0F0F0F0F;
        alu_control = 4'b0010;
        #10;
        $display("AND: %h", result);

        // OR
        alu_control = 4'b0011;
        #10;
        $display("OR : %h", result);

        // XOR
        alu_control = 4'b0100;
        #10;
        $display("XOR: %h", result);

        // Shift Left
        a = 32'd1;
        b = 32'd4;
        alu_control = 4'b0101;
        #10;
        $display("SLL: %d", result);

        // Shift Right
        a = 32'd16;
        b = 32'd2;
        alu_control = 4'b0110;
        #10;
        $display("SRL: %d", result);

        // Signed Less Than
        a = -32'sd5;
        b = 32'sd3;
        alu_control = 4'b0111;
        #10;
        $display("SLT: %d", result);
        
                // ZERO FLAG TEST
        a = 32'd10;
        b = 32'd10;
        alu_control = 4'b0001;   // SUB
        #10;
        $display("ZERO TEST: %d - %d = %d, zero = %b", a, b, result, zero);

        $finish;

    end

endmodule
