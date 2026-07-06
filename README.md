# MQL5 Risk Calculator ⚙️

A lightweight and efficient utility script for MetaTrader 5 (MT5), designed to dynamically calculate the precise trading volume (Lot Size) based on strict risk management parameters.

## 🎯 Overview
Proper risk management is the core of any successful algorithmic or manual trading system. This script eliminates manual calculations by determining the exact lot size needed based on the user's account balance, defined risk percentage, and desired stop-loss distance.

## ✨ Features
* **Dynamic Calculation:** Automatically adjusts to current account balance.
* **Broker Compatibility:** Normalizes the calculated lot size according to the specific broker's `SYMBOL_VOLUME_MIN`, `SYMBOL_VOLUME_MAX`, and `SYMBOL_VOLUME_STEP`.
* **Universal Symbol Support:** Works flawlessly on Forex, Metals, and Indices.

## 🚀 Installation & Usage
1. Download the `RiskCalculator.mq5` file.
2. Open MetaEditor in your MT5 terminal (press `F4`).
3. Place the file into the `MQL5\Scripts` directory.
4. Compile the file (press `F7`).
5. Drag and drop the script onto any chart.
6. Input your desired **Risk Percentage** and **Stop Loss Points** in the pop-up window.
7. Check the MT5 **Experts Journal** for the output log showing your optimal lot size.

---
*Developed for robust infrastructure testing in quantitative environments.*
