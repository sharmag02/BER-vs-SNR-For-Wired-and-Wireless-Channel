# BER vs SNR Analysis for Wired & Wireless Channels (Simulink + MATLAB)

This repository provides a complete setup to analyze **Bit Error Rate (BER)** vs **Signal-to-Noise Ratio (SNR)** using:

- ✅ A ready-to-use **Simulink Model (`bersnr.slx`)**
- ✅ MATLAB BER Tool (**BERtool**) for real-time curve plotting
- ✅ A MATLAB script for analytical BER vs SNR visualization
- ✅ Support for AWGN, Rayleigh, and Rician channels
- ✅ Support for modulation & coding customization

---

## 📘 Overview

This project allows users to quickly simulate BER performance for wired and wireless channels.  
You can modify:

- Channel type  
  - **AWGN (wired)**  
  - **Rayleigh (wireless)**  
  - **Rician (wireless)**  
- Modulation type  
  - BPSK, QPSK, QAM, etc.  
- Modulation index  
- Channel coding  
- SNR range  

The Simulink model and MATLAB scripts together help visualize how different parameters affect BER.

---

## 📁 Files in this Repository


---

## 🚀 How to Use the Simulink Model

1. Download the repository  
2. Open **MATLAB**  
3. Open the Simulink model:
4. Run the simulation
5. To open BERtool:
6. In BERtool, load the attached figure/model  
7. Now you can:
- Change **channel type**  
- Change **modulation scheme**  
- Change **modulation index**  
- Change **channel coding**  

BERtool instantly updates the BER vs SNR plot.

---

## 📈 How to Run the Mathematical BER Script

Run the script:

clc; clear; close all;
run('bersnr.m');
BER = qfunc(sqrt(SNR));

C  = nchoosek(2*L - 1, L)
BER = C * (1./(2*SNR)).^L

7. To open BERtool:

