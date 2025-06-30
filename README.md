# 🎲 Stochastic Arithmetic on FPGA

Implementation of basic arithmetic operations using **Stochastic Computing (SC)** on an FPGA, developed in the course **Co-Projeto Hardware e Software (CPHS)** at the **University of Coimbra**.

> 🧠 **Course:** Co-Projeto Hardware e Software (CPHS)  
> 🏫 **Institution:** Universidade de Coimbra – DEEC  
> 👨‍🎓 **Authors:** Gonçalo Bastos (2020238997), Leonardo Cordeiro (2020228071)  
> 📅 **Submission:** January 2024

---

## 🎯 Objective

Develop a proof of concept for stochastic computation on FPGA, as an alternative to traditional arithmetic. The system uses **pseudo-random bitstreams**, **comparators**, and **counters** to emulate binary-to-stochastic and stochastic-to-binary conversions.

The architecture includes:
- **LFSR** for random bitstream generation
- **Comparators** for stochastic encoding
- **Counters** for stochastic decoding
- A **NIOS II processor** for controlling the flow and visualizing results

---

## 🧪 Implementation Details

- Built using **Intel Quartus II**
- Used **Verilog/VHDL** to describe RTL blocks for:
  - LFSR generator
  - Binary-to-Stochastic and Stochastic-to-Binary modules
- Developed **C code** for NIOS II to:
  - Provide input (binary values, seed, window size)
  - Receive and display stochastic results on the console
- Output behavior:
  - Initial LED signal for seed input
  - Final LED indicates window completion
  - Eclipse terminal displays bitstream statistics (e.g. 14/128)

---

## 📹 Demo Video

A short video demonstrates the system running on the FPGA board, showing LED control and Eclipse output.

👉 [Watch demo video](Annexes/Video.mp4)

---

## 📂 Project Contents

- `Final_Project_Report.pdf`: Technical report (goal, design, results)
- `src/`: Quartus project files and C code for embedded logic
- `media/`: Video of implementation on FPGA
- `figures/`: Diagrams and output screenshots

---

## 🔍 Future Work

- Extend the system to support **arithmetic operations** (addition, multiplication)
- Study **performance and power gains** using SC in hybrid FPGA+software systems
- Improve randomness via true RNGs or feedback seeding

---

## 📝 Notes

The implementation demonstrates core stochastic computation blocks, with modular design and interface between logic and embedded software.

