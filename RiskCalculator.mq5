//+------------------------------------------------------------------+
//|                                               RiskCalculator.mq5 |
//|                                      Copyright 2026, XAU Dynamics|
//+------------------------------------------------------------------+
#property copyright "XAU Dynamics"
#property link      "https://github.com/xesufabule238-ops⁠"
#property version   "1.00"
#property script_show_inputs

//--- input parameters
input double InpRiskPercentage = 1.0; // Risk Percentage (%)
input int    InpStopLossPoints = 500; // Stop Loss (in Points)

//+------------------------------------------------------------------+
//| Script program start function                                    |
//+------------------------------------------------------------------+
void OnStart()
  {
   // Get Account Balance
   double balance = AccountInfoDouble(ACCOUNT_BALANCE);
   
   // Calculate maximum allowed loss in currency
   double riskAmount = balance * (InpRiskPercentage / 100.0);
   
   // Get Symbol Properties
   double tickValue = SymbolInfoDouble(_Symbol, SYMBOL_TRADE_TICK_VALUE);
   double tickSize = SymbolInfoDouble(_Symbol, SYMBOL_TRADE_TICK_SIZE);
   double point = SymbolInfoDouble(_Symbol, SYMBOL_POINT);
   
   if(InpStopLossPoints <= 0 || tickValue <= 0)
     {
      Print("Error: Invalid Stop Loss or Market Data not available.");
      return;
     }

   // Calculate the monetary loss per standard lot for the given Stop Loss
   double lossPerLot = InpStopLossPoints * tickValue * (point / tickSize);
   
   // Calculate raw Lot Size
   double lotSize = riskAmount / lossPerLot;
   
   // Normalize Lot Size to broker's volume steps
   double minLot = SymbolInfoDouble(_Symbol, SYMBOL_VOLUME_MIN);
   double maxLot = SymbolInfoDouble(_Symbol, SYMBOL_VOLUME_MAX);
   double stepLot = SymbolInfoDouble(_Symbol, SYMBOL_VOLUME_STEP);
   
   lotSize = MathRound(lotSize / stepLot) * stepLot;
   
   // Ensure lot size is within broker limits
   if(lotSize < minLot) lotSize = minLot;
   if(lotSize > maxLot) lotSize = maxLot;
   
   // Output the result to the terminal
   Print("========== XAU Dynamics Risk Calculator ==========");
   Print("Current Balance: $", DoubleToString(balance, 2));
   Print("Risk Amount (", InpRiskPercentage, "%): $", DoubleToString(riskAmount, 2));
   Print("Optimal Lot Size for ", _Symbol, " : ", DoubleToString(lotSize, 2));
   Print("==================================================");
  }
//+------------------------------------------------------------------+
