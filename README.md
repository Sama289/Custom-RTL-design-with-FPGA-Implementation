# 🔧 Custom RTL design with FPGA implementation.

This repository documents the complete development of a **4-bit Arithmetic and Logic Unit (ALU)** using a **hybrid design approach** that integrates both **full-custom transistor-level circuits** and **semi-custom RTL design** with FPGA implementation.


## Project Overview

-  Designed using **65nm CMOS technology**, **1.2V supply**, and **5pF output load**
-  RTL Design in **Verilog** for arithmetic and logic units
-  Comprehensive **testbench** including:
  - Corner case testing  
  - Randomized test generation  
  - Golden reference model verification
-  **Transistor-level schematics** and **block-level design** for gates and arithmetic units using **Cadence Virtuoso**
-  **Circuit-level simulations** for:
  - Worst-case propagation delay  
  - Maximum frequency power consumption
-  **FPGA implementation** for semi-custom prototyping

<p align="center">
  <img src="https://github.com/user-attachments/assets/f4df3b5a-6a03-43ae-a72c-ca1384e290df" alt="ALU Block Diagram" width="400"/>
</p>



##  Features

-  **Signed inputs/outputs**
-  Supports **8 arithmetic operations**
-  Supports **8 logical operations**
-  Testbench covers **all functional cases**
-  Simulation for **worst-case delay** and **max-frequency power**

<p align="center">
  <img src="https://github.com/user-attachments/assets/5159d3b8-a170-497c-aeec-b73e51dfb5e8" alt="ALU Operations Table" width="500"/>
</p>

---

## 🧠 Hints & Notes

- Use `std_logic_unsigned` with `std_logic_1164` for arithmetic operations in VHDL.
- Reuse common gates in Cadence by creating **symbols** (e.g., inverters, multiplexers).
