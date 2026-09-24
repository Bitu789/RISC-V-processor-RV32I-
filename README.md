
RISC-V EdgeAI Accelerator

Overview

RISC-V EdgeAI Accelerator explores a 64-bit RISC-V processor paired with a dedicated AI accelerator for parallel edge-AI workloads.

Proposed Architecture

Snapdragon-powered HP PC
        |
 On-device AI model
        |
Workload analysis / suggestions
        |
Python tooling
        |
RISC-V configuration
        |
+-------------------------+
| 64-bit RISC-V Core      |
|           |             |
|     AI Accelerator      |
|           |             |
| Parallel MAC / Matrix   |
| Quantization / Activate |
+-------------------------+
        |
      Memory

RISC-V Foundation

The existing project provides RTL modules for an ALU, Register File and Control Unit.

AI Accelerator Concept

The proposed accelerator targets matrix multiplication, MAC/vector operations, quantized workloads and configurable data movement. The RISC-V core controls accelerator execution while the accelerator performs parallel AI kernels.

Snapdragon / On-Device AI

The PC-side assistant is intended to use Qualcomm AI Hub or another supported open-source model. It can analyze workload characteristics, explain bottlenecks and suggest accelerator parameters. Qualcomm AI Hub supports optimizing, validating and deploying AI models for Qualcomm devices.

Technology

Verilog HDL / SystemVerilog

64-bit RISC-V RTL

RTL simulation

Python

Qualcomm AI Hub / supported runtime

GitHub

Snapdragon-powered HP PC

Current Status

The AI accelerator and AI-model integration in this README are a proposed extension of the existing RISC-V project. They should be implemented, simulated/tested and documented before being presented as completed functionality.

Future Work

Implement the accelerator RTL.

Define the RISC-V-to-accelerator interface.

Add testbenches and matrix/MAC kernels.

Build the PC-side AI assistant.

Optimize and validate the selected model on Snapdragon hardware.

Measure latency and memory behavior.

Goal

Bridge RISC-V processor design, dedicated AI acceleration, RTL development and on-device AI in one demonstrable prototype.
---

## ✨ Features

- 32-bit RV32I Architecture
- Single-Cycle Processor Design
- Modular RTL Implementation
- Register File
- ALU with Arithmetic & Logic Operations
- Immediate Generator
- Control Unit
- Data Memory
- Instruction Memory
- Branch Unit
- Write-Back Multiplexer
- RTL Simulation and Verification in Vivado

---

## 📂 Project Structure

```
RV32I-Processor/
│
├── README.md
├── LICENSE
│
├── src/
│   ├── RV32I_Processor.v
│   ├── ProgramCounter.v
│   ├── InstructionMemory.v
│   ├── InstructionDecoder.v
│   ├── ImmediateGenerator.v
│   ├── RegisterFile.v
│   ├── ControlUnit.v
│   ├── ALUControl.v
│   ├── ALUSourceMUX.v
│   ├── ALU.v
│   ├── DataMemory.v
│   ├── WriteBackMUX.v
│   └── BranchUnit.v
│
├── simulation/
│   └── tb_RV32I_Processor.v
│
├── images/
│   ├── RTL_Schematic.png
│   ├── Waveform.png
│   └── Block_Diagram.png
│
└── docs/
    └── Project_Report.pdf
```

---

## 🏗 Processor Architecture

```
                +----------------+
                | Program Counter|
                +--------+-------+
                         |
                         v
               +------------------+
               | Instruction Memory|
               +--------+---------+
                        |
                        v
               +------------------+
               |Instruction Decoder|
               +--------+---------+
                        |
        +---------------+----------------+
        |                                |
        v                                v
+---------------+               +----------------+
| Control Unit  |               | Register File  |
+-------+-------+               +--------+-------+
        |                                |
        |                                |
        +------------+-------------------+
                     |
                     v
           +--------------------+
           | Immediate Generator|
           +---------+----------+
                     |
                     v
                 +-------+
                 |  ALU  |
                 +---+---+
                     |
          +----------+----------+
          |                     |
          v                     v
 +----------------+     +----------------+
 | Data Memory    |     | WriteBack MUX  |
 +--------+-------+     +--------+-------+
          |                      |
          +----------+-----------+
                     |
                     v
              Register File
```

---

## ✅ Supported Instructions

### R-Type
- ADD
- SUB
- AND
- OR
- XOR
- SLT

### I-Type
- ADDI

### Memory Instructions
- LW
- SW

### Branch Instructions
- BEQ
- BNE

### Jump Instructions
- JAL

---

## 🛠 Tools Used

- Verilog HDL
- Xilinx Vivado
- RTL Simulation
- RISC-V RV32I ISA

---

## ▶ How to Run

1. Open Xilinx Vivado.
2. Create a new RTL project.
3. Add all source files from the `src` folder.
4. Add `tb_RV32I_Processor.v` as the simulation source.
5. Set `tb_RV32I_Processor` as the simulation top module.
6. Run Behavioral Simulation.
7. Observe the waveform and verify instruction execution.

---

## 📊 Simulation

The processor was verified using RTL simulation in Vivado.

Example program executed:

```
ADDI x1, x0, 5
ADDI x2, x0, 10
ADD  x3, x1, x2
SW   x3, 0(x0)
LW   x4, 0(x0)
JAL  x0, 0
```

Expected Register Values:

| Register | Value |
|----------|------:|
| x1 | 5 |
| x2 | 10 |
| x3 | 15 |
| x4 | 15 |

---

## 🚀 Future Improvements

- Five-Stage Pipeline
- Hazard Detection Unit
- Data Forwarding
- Full RV32I ISA Support
- RV32M Extension (Multiply/Divide)
- CSR Instructions
- Instruction & Data Cache
- FPGA Implementation

---

## 👨‍💻 Author
## 👨‍💻 Contributor

- **P. Manikantha** - RTL Design, Verilog Development, Processor Architecture, Functional Verification, Testing, and Documentation.
---

## 📄 License

This project is released under the MIT License.
