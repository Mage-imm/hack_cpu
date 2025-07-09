# Hack CPU (16-bit CPU in Verilog)

This is a hardware implementation of the **Hack CPU**, built from scratch in Verilog.  
It follows the architecture from the [Nand2Tetris](https://www.nand2tetris.org/) course.  
The project includes the ALU, A/D registers, Program Counter, ROM, RAM, and a testbench for simulation.

---

## 📁 Project Files

<pre>
<code>
hack_cpu/
├── comp_tb.v         // Testbench for full system
├── computer.v        // Top-level computer module
├── cpu.v             // Main Hack CPU logic
├── hack_alu.v        // ALU module
├── hack_pc.v         // Program counter
├── hack_register.v   // A and D registers
├── mux_2x1.v         // 2-to-1 multiplexer
├── ram.v             // RAM module
├── rom.v             // ROM module (loads prog.hex)
├── prog.hex          // Test program (Hack instructions in hex)
└── README.md         // This file
</code>
</pre>

---
## 🧪 About `prog.hex`

The `prog.hex` file contains your Hack assembly program in **hex format**, precompiled into machine code.

This file is loaded into the instruction memory (ROM) using the following Verilog command in `rom.v`:

```verilog
$readmemh("prog.hex", rom_memory);
```
---
## ⚙️ How to Simulate (Step-by-Step)

You’ll need:
- [Icarus Verilog](https://iverilog.fandom.com/wiki/Installation)
- [GTKWave](http://gtkwave.sourceforge.net/) (for waveform viewing)

---

### ✅ Step 1: Compile the Full Project

**If using Git Bash / Linux terminal:**

```bash
iverilog -o hack_cpu_tb \
hack_alu.v hack_pc.v hack_register.v mux_2x1.v \
ram.v rom.v cpu.v computer.v comp_tb.v
```
**If using Windows CMD or PowerShell (no backslashes):**
```bash
iverilog -o hack_cpu_tb hack_alu.v hack_pc.v hack_register.v mux_2x1.v ram.v rom.v cpu.v computer.v comp_tb.v
```

---

### ✅ Step 2: Run the Simulation

```bash
vvp hack_cpu_tb
```

---
### ✅ Step 3: View the Waveform in GTKWave (Optional)

Make sure your testbench (`testbench` module) includes:

```verilog
$dumpfile("wave.vcd");        // for GTKWave
$dumpvars(0, testbench);
```
**Then run**
```bash
gtkwave wave.vcd
```

You’ll be able to observe signals like:

A and D registers

PC (Program Counter)

ALU outputs

ROM/RAM access

Control signals
---

🙋‍♂️ Author
Manav Shah

Electronics and VLSI Design Student

GitHub: @Mage-imm




