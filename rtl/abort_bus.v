// the-open-circuit/rtl/abort_bus.v
// Placeholder for the combinational comparator that returns high if digest != known.

module abort_bus (
    input wire [31:0] current_digest,
    input wire [31:0] known_good_digest,
    output wire abort_signal
);

    // Combinational logic: abort if current_digest is not equal to known_good_digest
    assign abort_signal = (current_digest != known_good_digest);

endmodule
