## 1. Why This Matters – The “Probability‑50” Problem

| Domain | Typical Reliability Target (legacy) | Reality Today |
|--------|-------------------------------------|----------------|
| **Autonomous drones/swarm control** | ≥ 99 % success rate per maneuver | Probabilistic fallback (≈ 0.50) triggers unintended actions under stress (e.g., GPS jamming, cyber‑injection) |
| **Industrial robotics & grid controllers** | ≥ 95‑98 % fault detection latency | Delay ≈ 1‑2 µs means the hardware must still decide *before* a critical act (actuator motion, power switching). |
| **Financial market micro‑structures**| ~ 99.50 % per trade cycle | Latency of µs creates “market drag” for adversaries; a 0.01 % drop can cost millions in milliseconds. |

All three sectors are *highly probabilistic*: when the next event arrives (a signal pulse, a sensor reading, a micro‑order arrival) the system either **acts** or it **fails silently**—both outcomes damage mission success and stakeholder trust.
