# 4-Bit Adder with Seven-Segment Display (Basys3 FPGA)

## 📌 Project Description
This project implements a **4-bit ripple-carry adder (RCA)** with a **BCD-to-seven-segment display decoder** on the Basys3 FPGA board.  

- Two 4-bit numbers (A and B) are provided through the board’s switches.  
- The RCA adds the inputs and produces a binary sum.  
- The sum is passed through the BCD-to-seven-segment decoder.  
- The result is displayed on the Basys3 seven-segment LED display.  

This project builds on **Lab 2 (RCA/CLA)** by extending it with a display interface. The goal was to learn **hierarchical Verilog design**, **simulation workflows**, and **FPGA implementation**.


## ▶️ Simulation Instructions
We used **Vivado** for simulation.

1. Open Vivado and create a new project.  
2. Add the source files (`full_adder.v`, `ripple_adder.v`, `bcd7seg.v`, `adder_display_top.v`).  
3. Add the testbench (`tb_adder_display.v`).  
4. Run **Behavioral Simulation**.  
5. Check the waveforms:  
   - Example: A=4, B=5 → Sum=9 → Display shows "9"  
   - Example: A=1, B=2 → Sum=3 → Display shows "3"

---

## ⚡ FPGA Implementation
Steps for programming on the **Basys3**:

1. Connect the Basys3 board via USB and power it on.  
2. In Vivado, open the project with all Verilog source files.  
3. Add the `constraints.xdc` file and assign:  
   - Switches → Inputs A[3:0], B[3:0]  
   - Seven-seg display segments and anodes → Outputs  
4. Run **Synthesis** → **Implementation** → **Generate Bitstream**.  
5. Program the FPGA (`adder_display_top.bit`).  
6. Test on hardware:  
   - Flip switches to set A and B.  
   - The result shows on the seven-segment display.  

Example runs:  
- 4 + 5 → Display = **9**  
- 1 + 2 → Display = **3**  

---

