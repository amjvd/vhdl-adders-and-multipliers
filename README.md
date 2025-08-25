# VHDL Arithmetic Circuits – Serial & Parallel Multipliers

A digital design project implementing **Half Adders, Full Adders, and Multipliers** in VHDL.  
Includes a **serial shift-and-add multiplier** (FSM-controlled with shift registers) and a **parallel multiplier** (combinational, ripple-carry based).  
Both architectures were designed, simulated, and compared in terms of **speed, area, and efficiency trade-offs**.

---

## Project Structure
- `serial_multiplier/` – Shift-and-add design with FSM, shift registers, and 8-bit adder  
- `parallel_multiplier/` – Ripple-carry design with Half/Full Adders  
- `reports/` – Simulation waveforms, area/timing trade-offs, and project documentation  

---

## Serial Multiplier
- Uses **shift registers** for multiplier & multiplicand  
- **FSM-based control logic** alternates ADD/SHIFT cycles  
- 8-bit adder accumulates partial sums  
- Produces result over **4 cycles** → area-efficient, slower  

---

## Parallel Multiplier
- Built from **Half Adders and Full Adders**  
- Ripple-carry structure computes in **1 cycle** → faster, but larger area cost  
- Simpler control, higher speed  

---

## Technologies Used
- Language: **VHDL**  
- Tools: **EDAPlayground (with ALDEC Riveria Pro to simulate)** for simulation and waveforms  
- Concepts: **RTL design, FSMs, verification, trade-offs (speed/area/efficiency)**  

---

## Results
- **Serial multiplier**: area efficient, but requires multiple cycles (4 steps for 4-bit input)  
- **Parallel multiplier**: faster single-cycle result, but larger hardware footprint  
- Achieved **100% functional correctness** verified via test benches  
- Project awarded **full marks (100%)**  

---

## How to Run
To quickly run use the following eda links: https://www.edaplayground.com/x/SUYt for Parallel Multiplier and https://www.edaplayground.com/x/w3r3 for Serial Multiplier 
