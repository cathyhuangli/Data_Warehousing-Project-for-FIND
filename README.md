# FIND Data Warehousing Project using SQL and BI representation 

Based on the Company's strategy and KPIs, I impleted related quries in the SQL system and then performed BI representation using active KPIs Dashboards, piechart, bar chart and so on.

## Goal
FIND is a company that give home shoppers the opportunity to find furniture and home decors they like via AI-powered search technology, by bringing the customer directly to merchants’ product websites, based on an image the consumer uploads or chooses from the FIND app or website. For merchants, this allows them to get in front of consumers who are specifically seeking out their brand’s aesthetic, giving them more share of voice with your target audience and ultimately delivering more relevant leads. Customers can instantly search 100s of furniture sites at once to easily find shoppable products based on images you love. Users upload a photo or choose from our library and FIND delivers precise matches through the use of proprietary computer vision (artificial intelligence) algorithms.

Company FIND want to leverage user’s involvement information, including merchant users and customer users. In the direction to better understand customer behavior and experience, to increase users, and to understand the feedback/review of users. They want to visualize and analyze the history data they have collected, and also be able to answer questions about the data by queries in the SQL system. For example, related KPIs could involve: 
What is the daily/monthly customer usage of app?
How do our customers distribute across states?
How many new contracts with merchants we have per year?
How many merchants has continued cooperation with FIND for more than 3 years?
What is the average merchants/customers review by day?
How is our key partner merchant’s review has changed by year? 
What is the sales we have created for each merchant up to today?
What is the daily customer vs sales ratio has changed? 
How many new customers have been developed in the past week? 
How many merchants are in contract in FIND up to today?


## SQL Implementation
Architecture - 4 dimensional table and 1 aggregate table
-	The Customer Dimension displays the info table of Customers that logged in on company’s app ‘FIND’ daily, in the table CustomerInfo.
-	The MerchantInfo contains the data of the merchants that signed contracts with the company, to allow the customers go to their shopping interface through App FIND.
-	CustomerReview table and MerchantReview table contain feedback on app FIND from customers and users are collected, which are rated 5 levels satisfaction from 1 to 5 as Review, along with written content as Feedback.
-	SalesFact table is the aggregate table that contains merchant ID, name, daily customer number on the app, total merchant sales daily and then created sales per customer daily info for each merchant.

## BI representation
KPIs Dashboard
![KPIs Dashboard](https://github.com/cathyhuangli/SQL-implementation-and-BI-representation-for-Data-Warehousing-Task-/blob/master/KPI%20Dashboard.png)
On the dashboard, I have present the KPI and key information that was required when we tried to develop the dimensional model. The graph shown here are related with user involvement and the factors that indicating user loyalty. The top left is the values we have helped our contracted merchants to create, which is in two forms, total sales volume daily and average sales per merchant daily. The top right table is the new contracted merchant each year. The data is from table MerchantInfo. 
The three graphs below are for the customer involvement and loyalty measurement. The left two is from the CustomerInfo table, it shown the total customer daily and average customer involvement time daily. The right table is from the table CustomerReview, it shows how the average customer review has changed from the past three days.
