# ***Project: Automated Risk Scoring for Financial Compliance (RBI Standards)
Why I built this***--
Coming from a background in Banking Sector, I saw firsthand how much data goes into verifying a single customer. I wanted to see if I could automate that logic. This project uses SQL to automate a Risk-Based Approach —the same framework used by major banks to catch money laundering and fraud.

## **The Problem:**
In a dataset of 6 million transactions (PaySim), it is impossible for a human to find the "High Risk Based Customers" manually. If you only look at large amounts, you miss the "money mules" If you only look at frequent transactions, you miss the "whales-high value transaction customers."

## **What this tool does:**
I wrote a SQL-based scoring engine that assigns "Risk Points" to accounts based on three red flags:

1.**Velocity:** How fast is money moving-(High frequency = High Risk)

2.**Thresholds:** Is the user staying just below the ₹50k limit - (Structuring)

3.**Volume:** Is the total amount moved inconsistent with a normal profile?

## 1. **The Result** (After taking all 3 red flags into consideration ) :
<img width="870" height="685" alt="Screenshot 2026-02-22 220218" src="https://github.com/user-attachments/assets/fbb79293-736c-4742-8e56-6445bc9b8012" />

# **The Result: Turning 6 Million Rows into 10 Actionable Targets**
The query successfully processed the entire PaySim dataset and condensed it into a prioritized list of high-risk customers.

**Key Insights from the Output:**

**1.Weighted Ranking:** The Total_Risk_Score isn't just a count; it’s a weighted value that combines frequency, volume, and spikes. This ensures that a customer moving a moderate amount of money very frequently (a potential "Money Mule") is flagged just as effectively as someone moving a massive one-time sum.

**2.Immediate Prioritization:** By using ORDER BY Total_Risk_Score DESC, the system presents the most dangerous accounts at the very top. In a real banking environment, this list would be the daily "To-Do" list for a Fraud Investigation Team.

**3.Actionable Data:** Instead of just flagging a "Yes/No," the output provides the Frequency_Count and Total_Exposure alongside the ID, giving the investigator instant context for why the account was flagged before they even open the customer's profile.

## **Impact:**
#### Instead of a human team spending days manually auditing millions of transactions, this SQL engine identifies the top 10 most suspicious accounts in under 5 seconds, allowing for immediate Enhanced Due Diligence (EDD).
