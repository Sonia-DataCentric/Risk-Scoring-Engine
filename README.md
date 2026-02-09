# Risk-Scoring-Engine
##Project: Automated Risk Scoring for Financial Compliance (RBI Standards)
Why I built this
Coming from a background in Banking Sector, I saw firsthand how much data goes into verifying a single customer. I wanted to see if I could automate that logic. This project uses SQL to simulate a Risk-Based Approach (RBA)—the same framework used by major banks to catch money laundering and fraud.
The Problem:
In a dataset of 6 million transactions (PaySim), it is impossible for a human to find the "High Risk Based Customers" manually. If you only look at large amounts, you miss the "money mules" If you only look at frequent transactions, you miss the "whales-high value maintaining customers."

What this tool does:
I wrote a SQL-based scoring engine that assigns "Risk Points" to accounts based on three red flags:

Velocity: How fast is money moving-(High frequency = High Risk)

Thresholds: Is the user staying just below the ₹50k limit - (Structuring)

Volume: Is the total amount moved inconsistent with a normal profile?

The Results (After taking all 3 red flags into consideration ) 
