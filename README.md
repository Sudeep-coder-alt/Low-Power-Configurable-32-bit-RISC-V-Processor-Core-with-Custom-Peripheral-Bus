# Low-Power Configurable 32-bit RISC-V Processor Core with Custom Peripheral Bus

**RTL Design • RISC-V • Digital VLSI • ASIC Design**

> 🚧 **Project Status: Under Development**

## 📌 Overview

This project focuses on the progressive design and implementation of a **configurable 32-bit RISC-V processor core** using Verilog RTL, with a **custom peripheral bus** for communication with memory and peripheral modules.

The project is being developed as a practical exploration of:

- RTL design
- Digital processor architecture
- Datapath and control-path design
- Functional verification
- RTL simulation
- Logic synthesis
- Static Timing Analysis
- Power-conscious design
- Physical design
- RTL-to-GDS ASIC flow

The processor will be developed incrementally, starting from individual RTL components and progressing toward processor integration and eventually physical implementation.

---

## 🎯 Project Goals

- Design a configurable 32-bit RISC-V processor core
- Develop synthesizable Verilog RTL
- Understand processor datapath and control-path design
- Build modular and reusable RTL components
- Implement a custom peripheral bus
- Develop a structured functional verification environment
- Simulate and debug RTL using waveforms
- Perform logic synthesis
- Analyze area and timing
- Explore power-conscious RTL design techniques
- Progress toward physical implementation
- Explore the complete RTL-to-GDS ASIC design flow

---

## 🏗️ Planned Processor Architecture

```text
                 ┌─────────────────────────────┐
                 │      32-bit RISC-V CPU      │
                 │                             │
Instruction ────►│  Fetch                      │
                 │    ↓                        │
                 │  Decode                     │
                 │    ↓                        │
                 │  Register File              │
                 │    ↓                        │
                 │  ALU                        │
                 │    ↓                        │
                 │  Memory Access              │
                 │    ↓                        │
                 │  Write Back                 │
                 └──────────────┬──────────────┘
                                │
                         Custom Bus
                                │
              ┌─────────────────┼─────────────────┐
              │                 │                 │
         ┌────▼────┐      ┌────▼────┐      ┌────▼────┐
         │   RAM   │      │  UART   │      │  GPIO   │
         └─────────┘      └─────────┘      └─────────┘

```
---

## 🧩 Development Approach

The processor will be developed progressively, starting with individual RTL
building blocks and gradually integrating them into a complete RISC-V core.

### Phase 1 — RTL Building Blocks

The first stage focuses on implementing and verifying the fundamental
hardware components required by the processor.

Planned components include:

- ALU
- Register
- Register File
- Program Counter
- Instruction Decoder
- Control Unit
- Immediate Generator
- Instruction Memory
- Data Memory
- Peripheral Bus Interface

### Current Progress

The **ALU RTL and its testbench** have been implemented as the first
building block of the processor.

```text
rtl/
└── alu.v

tb/
└── alu_tb.v
```
---

## 🖥️ Phase 2 — RISC-V Processor Core

After developing the individual RTL components, they will be integrated
to form the processor datapath and control path.

The initial processor implementation will focus on a **single-cycle
RISC-V architecture** to understand instruction execution and processor
datapath design.

```text
             ┌─────────────┐
             │ Instruction │
             │   Memory    │
             └──────┬──────┘
                    │
                    ▼
              ┌───────────┐
              │   Decode  │
              └─────┬─────┘
                    │
          ┌─────────┴─────────┐
          ▼                   ▼
   ┌──────────────┐    ┌──────────────┐
   │ Register File│    │ Control Unit │
   └──────┬───────┘    └──────────────┘
          │
          ▼
       ┌─────┐
       │ ALU │
       └──┬──┘
          │
          ▼
      Data Memory
          │
          ▼
      Write Back
```
---

## ⚡ Phase 3 — Pipelined Architecture

After establishing the basic processor architecture, the design will
progress toward a pipelined implementation.

The planned five-stage pipeline is:

```text
IF → ID → EX → MEM → WB
```
The pipeline will introduce concepts such as:

- Pipeline registers
- Data hazards
- Forwarding
- Load-use hazards
- Pipeline stalls
- Branch handling
- Pipeline flushes

Example data hazard:

```text
ADD x1, x2, x3
SUB x4, x1, x5
        ↑
      Hazard
```
---

## 🔌 Custom Peripheral Bus

A custom peripheral bus will be developed to allow the processor core to
communicate with external memory and peripheral modules.

Planned peripheral architecture:

```text
                 RISC-V Core
                      │
                 Custom Bus
                      │
          ┌───────────┼───────────┐
          │           │           │
          ▼           ▼           ▼
         RAM         UART        GPIO
```
The bus protocol, signals, address mapping, and peripheral interfaces
will be documented as the implementation progresses.

---

## 🧪 Functional Verification

A structured verification environment will be developed for both
individual RTL blocks and the integrated processor.

Verification will progressively cover:

- ALU operations
- Arithmetic instructions
- Logical instructions
- Branch instructions
- Load/store operations
- Register operations
- Processor reset
- Pipeline hazards
- Forwarding
- Pipeline stalls
- Peripheral bus transactions
- Illegal instruction handling

Simulation waveforms will be analyzed using **GTKWave**.

The verification environment will progressively move from basic
testbenches toward self-checking verification.

---

## 🛠️ Toolchain

### Currently Used

| Tool | Purpose |
|---|---|
| **Icarus Verilog** | RTL simulation |
| **Verilator** | Simulation and RTL linting |
| **GTKWave** | Waveform analysis |
| **Yosys** | RTL synthesis |

### Planned for Later Stages

| Tool | Purpose |
|---|---|
| **OpenSTA** | Static Timing Analysis |
| **OpenROAD** | Physical design |
| **OpenLane** | RTL-to-GDS flow |
| **Magic** | Layout and GDS inspection |
| **KLayout** | GDS/layout viewing |
| **NanGate Open Cell Library** | Standard-cell technology library |

The project is intended to make use of open-source tools available on Linux wherever practical.

---

## 🔄 RTL-to-GDS Flow

The long-term objective is to explore the digital ASIC design flow from
RTL to physical implementation.

```text
Verilog RTL
     ↓
RTL Simulation
     ↓
Functional Verification
     ↓
Logic Synthesis
     ↓
Static Timing Analysis
     ↓
Floorplanning
     ↓
Placement
     ↓
Clock Tree Synthesis
     ↓
Routing
     ↓
DRC / LVS
     ↓
GDSII
```
---

## 🧮 Synthesis

After functional verification, the RTL will be synthesized using **Yosys**.

The synthesis stage will be used to study:

- Logic synthesis
- Logic optimization
- Technology mapping
- Standard-cell implementation
- Cell count
- Combinational logic
- Sequential logic
- Area estimation
- Critical paths

Synthesis scripts and relevant reports will be added to the repository
as the project progresses.

---

## ⏱️ Static Timing Analysis

After synthesis, Static Timing Analysis will be used to study the
timing behavior of the synthesized design.

Key concepts include:

- Clock definition
- Clock period
- Setup time
- Hold time
- Data arrival time
- Required arrival time
- Slack
- Critical paths

Planned flow:

```text
RTL
 ↓
Yosys
 ↓
Gate-Level Netlist
 ↓
OpenSTA
 ↓
Timing Reports
```
---

## 🏭 Physical Design

After synthesis and timing analysis, the project will progressively
explore physical implementation.

```text
Synthesis
    ↓
Floorplanning
    ↓
Placement
    ↓
Clock Tree Synthesis
    ↓
Routing
    ↓
DRC
    ↓
LVS
    ↓
GDSII
```
---

## 📁 Repository Structure

The repository will grow as the project progresses.

```text
Low-Power-32bit-RISC-V-Processor/
│
├── rtl/                 # Verilog RTL modules
│   └── alu.v
│
├── tb/                  # RTL testbenches
│   └── alu_tb.v
│
├── sim/                 # Simulation files and results
├── synthesis/           # Synthesis scripts and results
├── sta/                 # Static Timing Analysis
├── pnr/                 # Place and Route
├── gds/                 # GDSII outputs
├── reports/             # Design reports
├── programs/            # Processor test programs
└── docs/                # Architecture and documentation
```
---

## 📊 Project Status

| Component / Stage | Status |
|---|---|
| Project Architecture | 🚧 In Progress |
| ALU RTL | ✅ Implemented |
| ALU Testbench | ✅ Implemented |
| Register | ⏳ Planned |
| Register File | ⏳ Planned |
| Program Counter | ⏳ Planned |
| Instruction Decoder | ⏳ Planned |
| Control Unit | ⏳ Planned |
| Memory Interface | ⏳ Planned |
| RISC-V Core Integration | ⏳ Planned |
| Custom Peripheral Bus | ⏳ Planned |
| Functional Verification | ⏳ Planned |
| Pipelined Architecture | ⏳ Planned |
| Logic Synthesis | ⏳ Planned |
| Static Timing Analysis | ⏳ Planned |
| Physical Design | ⏳ Planned |
| GDSII Generation | ⏳ Planned |

---

## 🚀 Future Work

The project will progressively work toward:

- Complete the fundamental RTL building blocks
- Integrate the RISC-V processor core
- Implement the control path
- Implement the custom peripheral bus
- Add RAM, UART, and GPIO interfaces
- Develop processor-level verification
- Extend the design toward a pipelined architecture
- Implement hazard detection and forwarding
- Perform RTL synthesis using Yosys
- Analyze area and timing
- Perform Static Timing Analysis using OpenSTA
- Explore power-conscious RTL design techniques
- Explore physical implementation using OpenROAD/OpenLane
- Perform layout verification
- Generate and inspect GDSII

---

## 📚 Learning Focus

This project is being used to develop practical understanding of the
complete digital ASIC design flow:

```text
Digital Logic
     ↓
Verilog RTL
     ↓
Processor Architecture
     ↓
Functional Verification
     ↓
Logic Synthesis
     ↓
Static Timing Analysis
     ↓
Physical Design
     ↓
GDSII
```
---

