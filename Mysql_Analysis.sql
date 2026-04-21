CREATE DATABASE first_intership_project;
USE first_intership_project;
SELECT COUNT(*)FROM first_intership_project;
#querying the data to understand it better
#KPIS
#Total sales
SELECT
SUM(Total_Spent) AS Total_Amount
FROM first_intership_project;

SELECT

#Total unique customers
SELECT 
COUNT(DISTINCT Customer_Id) AS Total_Customer
FROM first_intership_project;

#Total Orders
SELECT
COUNT(DISTINCT Transaction_Id) AS Total_Orders
FROM first_intership_project;

#customer order value
SELECT
(COUNT(DISTINCT Transaction_Id)/COUNT(DISTINCT Customer_Id)) AS Customer_Order_Value
FROM first_intership_project;

#Total items sold
SELECT
SUM(Quantity) AS Total_Orders 
FROM first_intership_project;

#Average items per order
SELECT
CEIL(SUM(Quantity) / COUNT(DISTINCT Transaction_Id)) AS Average_Items_Per_Order
FROM first_intership_project;

#REVENUE TRENDS
#The busiest Day
SELECT
DAYNAME(Transaction_Date) AS Day_Name,
SUM(Total_Spent) AS Total_Sales
FROM first_intership_project
GROUP BY DAYOFWEEK(Transaction_Date),Day_Name
ORDER BY Total_Sales DESC;

#Rvenue trend per month
SELECT 
SUM(Total_Spent) AS Monthly_Revenue,
MONTHNAME(Transaction_Date) AS Transaction_Month
FROM first_intership_project
GROUP BY MONTH(Transaction_Date),Transaction_Month
ORDER BY Monthly_Revenue DESC;

#Yearly Cmparison
SELECT
DISTINCT(YEAR(Transaction_Date)) AS Transaction_Year,
SUM(Total_Spent) AS Yearly_Sales
FROM first_intership_project
GROUP BY Transaction_Year
ORDER BY Yearly_Sales DESC;

#The year  which has the most count discount as yes
#Number of orders that were discounted
SELECT
YEAR(Transaction_Date) AS T_Year,
COUNT(*) AS Discounted_Orders
FROM first_intership_project
WHERE Discount_Applied='True'
GROUP BY T_Year
ORDER BY T_Year;

#total orders made per year
SELECT
YEAR(Transaction_Date) AS T_Year,
COUNT(DISTINCT Transaction_Id) AS Total_Orders
FROM first_intership_project
GROUP BY T_Year
ORDER BY Total_Orders DESC;

#Total Customers who orderd in in every year
SELECT
YEAR(Transaction_Date) AS Transaction_Year,
COUNT(DISTINCT Customer_Id) AS Total_Customers
FROM first_intership_project
GROUP BY Transaction_Year
ORDER BY Total_Customers DESC;

#lower average order
SELECT
YEAR(Transaction_Date) AS T_Year,
ROUND(SUM(Total_Spent)/COUNT(DISTINCT Transaction_Id),2) AS Average_Order_Value
FROM first_intership_project
GROUP BY T_Year
ORDER BY Average_Order_Value DESC;

#average items per order
SELECT 
    YEAR(Transaction_Date) AS order_year,
    ROUND(SUM(Quantity) / COUNT(DISTINCT Transaction_ID), 2) AS avg_items_per_order
FROM first_intership_project
GROUP BY YEAR(Transaction_Date)
ORDER BY order_year;

#category that is best selling based on total revenue
SELECT
Category,
SUM(Total_Spent) AS Total_Sales
FROM first_intership_project
GROUP BY Category
ORDER BY Total_Sales DESC;

#best selling category based on total items sold
SELECT
Category,
SUM(Quantity) AS Total_Items_Sold
FROM first_intership_project
GROUP BY Category 
ORDER BY Total_Items_Sold DESC;

#do most people come to store or buy online
SELECT
Location,
SUM(Total_Spent) AS Total_Sales
FROM first_intership_project
GROUP BY Location 
ORDER BY Total_Sales DESC;

#The most frequently used mode of payment
SELECT
Payment_Method,
SUM(Total_Spent) AS Total_Sales
FROM first_intership_project
GROUP BY Payment_Method
ORDER BY Total_Sales DESC;

#sales method vs payment mode
SELECT 
    Location,
    Payment_Method,
    COUNT(*) AS total_orders,
    SUM(Total_Spent) AS total_revenue
FROM first_intership_project
GROUP BY Location, Payment_Method
ORDER BY total_revenue DESC;

#revenue per customer
SELECT
Customer_Id,
SUM(Total_Spent) AS Total_Sales,
SUM(Quantity) AS Total_Items_Bought,
COUNT(Transaction_Id) AS Total_Orders
FROM first_intership_project
GROUP BY Customer_Id 
ORDER BY Total_Sales DESC
LIMIT 10;

#CHECKING WHETHER DISCOUNT INFLUENCED REVENUE 
SELECT 
    Discount_Applied,
    COUNT(*) AS orders_count,
    AVG(Total_Spent) AS avg_order_value,
    SUM(Total_Spent) AS revenue
FROM first_intership_project
WHERE Discount_Applied <> '<NA>'
GROUP BY Discount_Applied;

#channel payment method over time
SELECT 
    YEAR(Transaction_Date) AS order_year,
    Location,
    SUM(Total_Spent) AS revenue
FROM first_intership_project
GROUP BY YEAR(Transaction_Date), Location;



















