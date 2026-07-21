# RISC-V-processor-RV32I-# RV32I Single-Cycle RISC-V Processor

A 32-bit **RV32I Single-Cycle RISC-V Processor** designed using **Verilog HDL** and verified in **Xilinx Vivado**. This project implements the basic RISC-V instruction set architecture (ISA) with modular RTL design and functional simulation.

---

## 📌 Project Overview

This project demonstrates the design and implementation of a 32-bit single-cycle RISC-V processor based on the RV32I instruction set. The processor executes one instruction per clock cycle and is built using a modular architecture consisting of independent Verilog modules.

The processor supports arithmetic, logical, load/store, branch, and jump operations and has been verified using RTL simulation in Xilinx Vivado.

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

**P. Manikantha**

B.Tech Electronics and Communication Engineering (ECE)

Specialization: VLSI Design

---

## 📄 License

This project is released under the MIT License.
