# Hack CPU (16-bit CPU in Verilog)

This is a hardware implementation of the **Hack CPU**, designed from scratch using Verilog, based on the [Nand2Tetris](https://www.nand2tetris.org/) architecture.  
It includes core modules like the ALU, registers, program counter, RAM, ROM, and a testbench.

---

## 📁 Project Files

<pre>
<code>
hack_cpu/
├── comp_tb.v         // Testbench for full system
├── computer.v        // Top-level computer system
├── cpu.v             // Main Hack CPU module
├── hack_alu.v        // ALU
├── hack_pc.v         // Program counter
├── hack_register.v   // A and D registers
├── mux_2x1.v         // Multiplexer
├── ram.v             // RAM module
├── rom.v             // ROM module
├── prog.hex          // ROM input file (Hack instructions)
└── README.md         // Project description
</code>
</pre>

---

## 🧪 Test Program – `prog.hex`

- This file contains a test program in **Hack machine code (hex)**
- Loaded by `rom.v` using:

  ```verilog
  $readmemh("prog.hex", memory);
