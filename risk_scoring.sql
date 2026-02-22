/* * ==============================================================================
 * Project: Customer Risk Scoring (RBA Model)
 * Author:  Sonia
 * Goal:    Identify high-risk customers for Enhanced Due Diligence (EDD),
 * making sure we are strictly following RBI compliance rules.
 * ==============================================================================
 */

-- NOTE: We are creating a view to act as our "Risk Dashboard."
-- This allows Compliance Officers to query the latest scores instantly.
CREATE VIEW Customers_Risk AS
SELECT 
    nameOrig AS Customer_ID,
    
    -- --- B E H A V I O R A L   A N A L Y S I S ---
    -- How active is this customer?
    COUNT(step) AS Frequency_Count,
    
    -- How much total money is being moved?
    SUM(amount) AS Total_Exposure,

    -- --- T H E   R I S K   S C O R I N G   E N G I N E ---
    -- We sum up points based on specific red flags:
    
    -- Flag 1: High Volume (Matches RBI reporting thresholds)
    (CASE 
        WHEN SUM(amount) > 1000000 THEN 40  -- Massive Volume (>10 Lakhs)
        WHEN SUM(amount) BETWEEN 500000 AND 1000000 THEN 20 -- High Volume
        ELSE 5 
    END) 
    +
    -- Flag 2: High Frequency
    (CASE 
        WHEN COUNT(step) > 50 THEN 30      -- Too many small transactions
        WHEN COUNT(step) BETWEEN 20 AND 50 THEN 15
        ELSE 0 
    END) 
    +
    -- Flag 3: Sudden Large Spike
    (CASE 
        WHEN MAX(amount) > 500000 THEN 30
        ELSE 0 
    END) 
    AS Total_Risk_Score

FROM PaySim
GROUP BY nameOrig;
GO -- Batch separation for SSMS

-- ==============================================================================
-- ACTION ITEM: Investigation Pipeline
-- ==============================================================================
-- Displaying  the top 10 most suspicious accounts for review.
SELECT TOP 10 
    Customer_ID, 
    Frequency_Count, 
    Total_Exposure, 
    Total_Risk_Score 
FROM v_Customer_Risk_Scores 
ORDER BY Total_Risk_Score DESC;

