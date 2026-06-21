// the-open-circuit/verification/monitor_tb.v
// Placeholder for the formal verification test suite for the monitor module.

`timescale 1ns / 1ps

module monitor_tb;

    // Inputs
    reg [255:0] state_snapshot;

    // Outputs
    wire abort;

    // Instantiate the Unit Under Test (UUT)
    monitor uut (
        .state_snapshot(state_snapshot),
        .abort(abort)
    );

    initial begin
        // Initialize Inputs
        state_snapshot = 256'h0;

        // Apply test vectors
        #10;
        state_snapshot = 256'h00000000000000000000000000000000000000000000000000000000DEADBEEF;
        #10;
        state_snapshot = 256'h00000000000000000000000000000000000000000000000000000000BEEFDEAD;
        #10;
        state_snapshot = 256'h00000000000000000000000000000000000000000000000000000000DEADBEEF;
        #10;

        $finish;
    end

    always @(abort) begin
        $display("At time %t, abort signal is %b", $time, abort);
    end

endmodule
