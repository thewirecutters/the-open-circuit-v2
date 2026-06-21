// the-open-circuit/rtl/immutable_rom.v
// Placeholder for the locked read-only memory block.

module immutable_rom (
    input wire [4:0] address,
    output wire [31:0] data_output
);

    // Placeholder for a 32-bit known-good fingerprint
    // In a real implementation, this would be programmed at configuration time into OTP/secure-ROM.
    reg [31:0] stored_fingerprint = 32'hDEADBEEF; // Example fingerprint

    assign data_output = stored_fingerprint;

endmodule
