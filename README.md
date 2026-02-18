##**Project: Automated Risk Scoring for Financial Compliance (RBI Standards)
Why I built this**
Coming from a background in Banking Sector, I saw firsthand how much data goes into verifying a single customer. I wanted to see if I could automate that logic. This project uses SQL to automate a Risk-Based Approach —the same framework used by major banks to catch money laundering and fraud.
**The Problem:**
In a dataset of 6 million transactions (PaySim), it is impossible for a human to find the "High Risk Based Customers" manually. If you only look at large amounts, you miss the "money mules" If you only look at frequent transactions, you miss the "whales-high value transaction customers."

**What this tool does:**
I wrote a SQL-based scoring engine that assigns "Risk Points" to accounts based on three red flags:

1.**Velocity:** How fast is money moving-(High frequency = High Risk)

2.**Thresholds:** Is the user staying just below the ₹50k limit - (Structuring)

3.**Volume:** Is the total amount moved inconsistent with a normal profile?

**The Result** (After taking all 3 red flags into consideration ) :


