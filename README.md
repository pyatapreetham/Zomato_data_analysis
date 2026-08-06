# Zomato_data_analysis

Zomato Business Intelligence Dashboard | Power BI
📌 Project Overview

This project presents an end-to-end Business Intelligence Dashboard built using Microsoft Power BI to analyze the performance of a food delivery platform (Zomato). The dashboard focuses on identifying business challenges, uncovering actionable insights, and supporting data-driven decision-making through interactive visualizations.

The analysis is based on three datasets: Orders, Customers, and Restaurants. The project transforms raw transactional data into meaningful business insights by using data modeling, DAX measures, and interactive dashboards.

🎯 Business Problems
1. Revenue is Inconsistent

The company has experienced fluctuations in revenue over time. This project investigates the key factors contributing to these variations.

2. Restaurants are Underperforming

Several restaurants generate lower revenue and order volumes. This project identifies underperforming restaurants and analyzes the factors affecting their performance.

🎯 Objectives
Analyze overall business performance.
Monitor revenue trends over time.
Evaluate restaurant performance.
Compare revenue across cities and cuisines.
Measure customer ordering behavior.
Build interactive dashboards for business users.
Support strategic business decisions through data visualization.
🗂 Dataset

The project consists of three datasets.

Orders
Order ID
Customer ID
Restaurant ID
Order Timestamp
Order Amount
Revenue
Discount Amount
Delivery Fee
Payment Mode
Order Status
Customers
Customer ID
Customer Name
City
Signup Time
Acquisition Channel
Restaurants
Restaurant ID
Restaurant Name
Cuisine
City
Average Rating
🛠 Tools & Technologies
Microsoft Power BI
Power Query
DAX (Data Analysis Expressions)
Data Modeling
Microsoft Excel (Data Cleaning)
Git & GitHub
📊 Data Modeling

The data model follows a Star Schema.

Customers
      │
      │
Orders ───── Restaurants
      │
      │
     Date

Relationships:

Customers → Orders
Restaurants → Orders
Date → Orders
📈 Dashboard Pages
📄 Page 1 – Executive Overview

This page provides a high-level overview of business performance.

KPIs
Total Revenue
Total Orders
Total Customers
Total Restaurants
Average Order Value (AOV)
Cancellation Rate
Average Rating
Visuals
Monthly Revenue Trend
Revenue by City
Revenue by Cuisine
Order Status Distribution
Filters
Year
City
Restaurant
📄 Page 2 – Revenue Analysis

Focused on identifying the reasons behind inconsistent revenue.

KPIs
Total Revenue
Total Orders
Average Order Value
Cancellation Rate
Visuals
Monthly Revenue Trend
Revenue by Restaurant
Revenue by City
Revenue vs Discount Analysis
Business Insights
Monthly revenue fluctuations
Revenue contribution by restaurant
Revenue comparison across cities
Impact of discounts on revenue
📄 Page 3 – Restaurant Performance

Focused on identifying underperforming restaurants.

KPIs
Total Restaurants
Average Rating
Average Revenue per Restaurant
Average Orders per Restaurant
Visuals
Top 10 Restaurants by Revenue
Bottom 10 Restaurants by Revenue
Revenue by Cuisine (Donut Chart)
Restaurant Ratings Analysis
Business Insights
Best-performing restaurants
Lowest-performing restaurants
Cuisine-wise performance
Restaurant rating comparison
📌 DAX Measures Created

Some of the key DAX measures include:

Total Revenue
Total Orders
Total Customers
Total Restaurants
Average Order Value (AOV)
Cancellation Rate
Average Revenue per Restaurant
Average Orders per Restaurant
📈 Key Insights
Revenue Analysis
Revenue fluctuates across different months.
Certain cities contribute significantly more revenue than others.
Restaurant performance varies across locations.
Discounts influence revenue trends but are not the sole factor.
Restaurant Performance
A small number of restaurants contribute the majority of revenue.
Some restaurants consistently underperform.
Cuisine preference differs across cities.
Restaurant ratings provide additional context for performance evaluation.
🚀 Features
Interactive dashboard navigation
Dynamic slicers and filters
Responsive KPI cards
Drill-down analysis
Business-focused visualizations
Clean and user-friendly interface
📷 Dashboard Preview
Dashboard 1
Executive Overview

Dashboard 2
Revenue Analysis

Dashboard 3
Restaurant Performance

(Add screenshots of each dashboard page here after uploading them to the repository.)

📁 Repository Structure
Zomato-PowerBI-Dashboard/
│
├── Data/
│   ├── Orders.csv
│   ├── Customers.csv
│   └── Restaurants.csv
│
├── Dashboard/
│   └── Zomato_Dashboard.pbix
│
├── Images/
│   ├── Executive_Overview.png
│   ├── Revenue_Analysis.png
│   └── Restaurant_Performance.png
│
├── README.md
└── LICENSE
🎯 Future Improvements
Add forecasting for revenue trends.
Build customer retention and acquisition analysis.
Include advanced drill-through pages.
Publish the dashboard to Power BI Service.
Implement Row-Level Security (RLS).
📚 Learning Outcomes

Through this project, I gained hands-on experience in:

Data cleaning and transformation using Power Query
Building a star schema data model
Writing DAX measures and calculated columns
Designing interactive Power BI dashboards
Creating business-focused KPIs and reports
Applying data visualization best practices
Converting raw data into actionable business insights
👨‍💻 Author

Pyata Preetham

🎓 BCA Student
📊 Aspiring Data Analyst / Business Intelligence Analyst
💻 Skills: Power BI, SQL, Python, Excel, DAX, Power Query
