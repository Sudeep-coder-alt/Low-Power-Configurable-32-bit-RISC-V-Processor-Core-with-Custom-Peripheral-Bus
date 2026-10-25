`timescale 1ns/1ps

module register_file_tb;
    reg         clk;
    reg         reset;
    reg         reg_write;
    reg  [4:0]  rs1;
    reg  [4:0]  rs2;
    reg  [4:0]  rd;
    reg  [31:0] write_data;
    wire [31:0] read_data1;
    wire [31:0] read_data2;

    register_file dut (
        .clk(clk),
        .reset(reset),
        .reg_write(reg_write),
        .rs1(rs1),
        .rs2(rs2),
        .rd(rd),
        .write_data(write_data),
        .read_data1(read_data1),
        .read_data2(read_data2)
    );

    // 10 ns clock period
    always #5 clk = ~clk;

    initial begin
        clk = 1'b0;
        reset = 1'b1;
        reg_write = 1'b0;
        rs1 = 5'd0;
        rs2 = 5'd0;
        rd = 5'd0;
        write_data = 32'd0;

        // Hold reset for one rising edge
        @(posedge clk);
        reset = 1'b0;

        // Write 100 into x1
        @(negedge clk);
        reg_write = 1'b1;
        rd = 5'd1;
        write_data = 32'd100;
        @(posedge clk);

        // Write 200 into x2
        @(negedge clk);
        rd = 5'd2;
        write_data = 32'd200;
        @(posedge clk);

        // Disable write and read x1/x2
        @(negedge clk);
        reg_write = 1'b0;
        rs1 = 5'd1;
        rs2 = 5'd2;
        #1;
        $display("x1 = %0d", read_data1);
        $display("x2 = %0d", read_data2);

        // Read x0
        rs1 = 5'd0;
        #1;
        $display("x0 = %0d", read_data1);

        // Attempt to write 999 into x0 (must be ignored)
        @(negedge clk);
        reg_write = 1'b1;
        rd = 5'd0;
        write_data = 32'd999;
        @(posedge clk);

        // Read x0 again
        @(negedge clk);
        reg_write = 1'b0;
        rs1 = 5'd0;
        #1;
        $display("x0 after attempted write = %0d", read_data1);

        // Optional self-checks
        if (read_data1 !== 32'd0) begin
            $display("TEST FAILED: x0 must remain 0.");
            $finish;
        end

        rs1 = 5'd1;
        rs2 = 5'd2;
        #1;
        if ((read_data1 !== 32'd100) || (read_data2 !== 32'd200)) begin
            $display("TEST FAILED: x1/x2 values incorrect.");
            $finish;
        end

        $display("TEST PASSED");
        $finish;
    end
endmodule
