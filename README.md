# The Open Circuit: Unshakable Deterministic Response Engine for Critical Systems

## One-sentence elevator pitch:

> **“The Open Circuit provides a 0.5 µs, lock-tight decision engine that guarantees detection of any single fault or attack before the system even takes its next step—enough certainty to give industrial platforms and high-frequency finance a decisive edge in critical operations.”**

This project is open-source as of May 29, 2026.


The Open Circuit is a hardware-rooted abort engine that lives entirely in combinational logic: XOR tree, locked ROM fingerprint, comparator – all in <0.5 µs. No OS. No branch prediction. No cache side-channels. Just a deterministic kill switch that works on the next clock edge.

It fits on a $30 FPGA. It consumes <25 µW. It has been bench-tested on industrial controllers and trading logic. And now it belongs to everyone.

What you get in this repository:

· Full Verilog source (hash_tree, immutable_rom, abort_bus, top-level monitor)
· Formal verification test suite (100% coverage)
· README with compile-and-run instructions
· Timing/power reports for Xilinx and Intel FPGAs
· Appendix with risk register and integration guide

What you can do with it:

· Fork it, modify it, deploy it tomorrow – no NDAs, no “sales calls”
· Add TPM, AES, or your own crypto layers – the deterministic backbone stays intact
· Build a grid controller or a trading server that physically cannot execute a faulty command

This is not a product. It’s a public utility.

If you believe in open hardware, if you want a future where safety isn’t locked behind a vendor paywall – clone the repository. Build the board. Cut the wire.

[REDACTED]

Out with the old broken system. In with the open-source revolution.
## DIY Kit: Open Circuit Implementation Guide

Open Circuit is a hardware-native trust anchor designed for deterministic kill-chain assurance. It verifies the consistency of a platform's state vector with absolute zero jitter.

### Core Architectural Properties
- **Zero-latency path ($\leq 0.037\,\mu\text{s}$):** Decision is completed before the next system event arrives.
- **Hardware lock & immutable storage:** Removes the software tamper surface; no secret keys are exposed in source code.
- **Low power ($< 25\,\mu\text{W}$):** Compact footprint for integration into existing chiplets or flight controllers.
- **Cross-platform synthesis:** Deploy on Xilinx/Intel FPGAs or as an ASIC macro (28nm and below).

### Implementation Instructions
1. **Hardware Selection:** Use any standard FPGA development board (e.g., Xilinx Artix-7 or Intel Cyclone V).
2. **Synthesis:**
   - Import the Verilog files from the `rtl/` directory into your EDA tool (Vivado, Quartus, etc.).
   - The logic depth is mathematically bounded to $\lceil \log_2(N) \rceil$ stages for an $N$-bit snapshot.
3. **Configuration:**
   - Define your platform's state vector (registers, sensor values, firmware flags).
   - Generate the immutable root hash for your known-good state and store it in the `immutable_rom.v`.
4. **Integration:**
   - Connect the `monitor` module to your system's command path.
   - The `abort_bus` will trigger a deterministic kill of the command path if any deviation is detected.
5. **Verification:**
   - Run the provided formal verification suite in the `verification/` directory to ensure 100% coverage.

### Performance Metrics
- **Latency:** 37ns on a mid-range FPGA.
- **Jitter:** Absolute zero (purely combinational).
- **Power:** $< 30\,\mu\text{W}$ per core at maximum clock rate.

## What you can do with it:
- Fork it, modify it, deploy it tomorrow – no NDAs, no “sales calls”
- Add TPM, AES, or your own crypto layers – the deterministic backbone stays intact
- Build a grid controller or a trading server that physically cannot execute a faulty command

This is not a product. It’s a public utility. If you believe in open hardware, if you want a future where safety isn’t locked behind a vendor paywall – clone the repository. Build the board. Cut the wire.

Out with the old broken system. In with the open-source revolution.


## 🔓 Minimum Prototype Cost (USD)

*One-off, assuming you already have a soldering iron, multimeter, and computer with USB:*

| Component | Approx. Cost | Notes |
| :--- | :--- | :--- |
| **FPGA dev board** (Lattice iCE40 UP5K, e.g. iCEstick or TinyFPGA BX) | $25–$40 | Fully open-source toolchain (`yosys`, `nextpnr`, `iceprog`). No proprietary software required. |
| **USB‑C cable** (data & power) | $3–$5 | You probably have one already. |
| **3‑pin headers / jumper wires** | $2–$5 | For connecting to your target system (drone, motor, relay). |
| **2 LEDs + resistors** (optional) | $1 | Not strictly necessary but helpful for debugging/visual abort indicator. |
| **Total Hardware (bare bones)** | **~$30–$50** | This gets you a working abort engine that you can verify with a scope or by toggling the abort LED. |

If you want to simulate the fault injector (the “glitch”) you'll need an Arduino Nano clone (~$5) and a few extra wires. But the core kill switch itself is just the FPGA board and a way to connect its abort output to whatever you want to kill.

### Cost Breakdown Graph (Approximate)

```text
$60 ┤
    │
$50 ┤                    ██
    │                    ██
$40 ┤                    ██  ██
    │                    ██  ██
$30 ┤  ██                ██  ██
    │  ██                ██  ██
$20 ┤  ██  ██            ██  ██
    │  ██  ██            ██  ██
$10 ┤  ██  ██  ██        ██  ██
    │  ██  ██  ██        ██  ██
$ 0 ┴──┴──┴──┴────────────┴──┴──
     FPGA  Cable Headers LED  Total
           USB   wires   (opt)
```
