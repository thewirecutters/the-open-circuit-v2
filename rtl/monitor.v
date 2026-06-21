// the-open-circuit/rtl/monitor.v
// Top-level monitor module tying together hash_tree, immutable_rom, and abort_bus.

module monitor (
    input wire [255:0] state_snapshot,
    output wire        abort
);

    wire [31:0] current_digest;
    wire [31:0] known_good_fingerprint;

    // Instantiate hash_tree
    hash_tree u_hash_tree (
        .state_input(state_snapshot),
        .digest_output(current_digest)
    );

    // Instantiate immutable_rom
    immutable_rom u_immutable_rom (
        .address(5'b00000), // Address is not used in this placeholder, but kept for interface consistency
        .data_output(known_good_fingerprint)
    );

    // Instantiate abort_bus
    abort_bus u_abort_bus (
        .current_digest(current_digest),
        .known_good_digest(known_good_fingerprint),
        .abort_signal(abort)
    );

endmodule
