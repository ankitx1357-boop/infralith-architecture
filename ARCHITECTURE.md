# INFRALITH CORE ARCHITECTURE

## 1. System Overview
Infralith is a monolithic state machine designed to unify three divergent AI workloads into a single Node.js runtime.

## 2. Component Design

### A. The Agent Swarm (Recursive Logic)
* **Pattern:** Chain-of-Thought (CoT) State Machine.
* **Flow:** `PLAN` -> `ARCHITECT` -> `CODE` -> `TEST` -> `DEPLOY`.
* **Error Handling:** Implements a self-healing loop. If `TEST` fails, the state reverts to `CODE` with error context.

### B. Media Forge (Async Queue)
* **Pattern:** Publisher/Subscriber (Pub/Sub).
* **Concurrency:** Non-blocking event loop offloads rendering simulation to prevent main-thread starvation.

### C. Edge Bridge (Hybrid Compute)
* **Technology:** WebAssembly (WASM) + WebGPU.
* **Strategy:** "Thick Client" architecture. We move 8GB+ LLM inference from the server cost center to the client device.

## 3. Security Protocols
* **Rate Limiting:** Token Bucket algorithm (100 req/min).
* **Authentication:** Bearer Token (Custom `PASS_ACCESS` header).

---
*Confidential: Property of Infralith Labs*