--customer analysis--
--question one ---

SELECT customerID,SUM(totalAmount) AS totalbill
FROM bills
GROUP BY customerID
ORDER BY totalbill DESC
LIMIT 5;
--question two--
SELECT CustomerID, AVG(DATEDIFF(DateCreated, BillDate)) AS AvgPaymentTime
FROM bills
WHERE Status = 'Paid'
GROUP BY CustomerID;
--question three--
SELECT DISTINCT CustomerID
FROM bills AS b
WHERE NOT EXISTS (
SELECT 1
FROM bills AS b2
WHERE b2.CustomerID = b.CustomerID
AND b2.Status = 'Paid'
AND b2.DateCreated > b2.DueDate
);
--using bill_items--
--question 1--
SELECT SUM(LineTotal) AS TotalRevenue
FROM bill_items;
--question 2--
SELECT BillItemID, LineTotal 
FROM bill_items 
ORDER BY LineTotal DESC 
LIMIT 1;
--question 3--
SELECT BillItemID, LineTotal 
FROM bill_items 
ORDER BY LineTotal ASC 
LIMIT 1;
--PAYMENT TABEL--
--question 1--
SELECT PaymentMethod, COUNT(*) AS PaymentCount
FROM payments
GROUP BY PaymentMethod
ORDER BY PaymentCount DESC
LIMIT 1;
--question 2--
SELECT PaymentMethod, SUM(PaymentAmount) AS TotalRevenue 
FROM payments 
GROUP BY PaymentMethod;
--question 3--
SELECT AVG(PaymentAmount) AS AveragePayment 
FROM payments;
--data analysis and insights--
--question 1--
SELECT CategoryID, SUM(TotalAmount) AS TotalRevenue
FROM bills
GROUP BY CategoryID
ORDER BY TotalRevenue DESC
LIMIT 3;
--question 2--
SELECT CustomerID, COUNT(*) AS UnpaidCount
FROM bills
WHERE Status = 'Unpaid'  -- Adjust status value if needed (e.g., 'Pending')
GROUP BY CustomerID
ORDER BY UnpaidCount DESC
LIMIT 1;