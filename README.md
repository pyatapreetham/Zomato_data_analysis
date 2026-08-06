# 🍽️ Zomato data analysis

## 📌 Project Overview

This project presents an end-to-end **Business Intelligence Dashboard** built using **Microsoft Power BI** to analyze the performance of a food delivery platform (Zomato). The dashboard focuses on identifying key business challenges, uncovering actionable insights, and supporting data-driven decision-making through interactive visualizations.

The analysis is based on three datasets: **Orders**, **Customers**, and **Restaurants**. The project transforms raw transactional data into meaningful business insights using **Power Query**, **DAX**, **Data Modeling**, and **interactive dashboards**.

---

# 🎯 Business Problems

## 1️⃣ Revenue is Inconsistent

The company has experienced fluctuations in revenue over time. This dashboard analyzes the major factors contributing to revenue inconsistency and helps identify opportunities to stabilize business performance.

## 2️⃣ Restaurants are Underperforming

Several restaurants generate lower revenue and receive fewer orders than others. This dashboard identifies underperforming restaurants and analyzes their performance using revenue, ratings, cuisine, and order trends.

---

# 🎯 Objectives

- Analyze overall business performance
- Monitor revenue trends over time
- Evaluate restaurant performance
- Compare revenue across cities and cuisines
- Measure customer ordering behavior
- Build interactive dashboards for business users
- Support data-driven decision making

---

# 📂 Dataset

The project uses three datasets:

## 📦 Orders

- Order ID
- Customer ID
- Restaurant ID
- Order Timestamp
- Order Amount
- Revenue
- Discount Amount
- Delivery Fee
- Payment Mode
- Order Status

---

## 👥 Customers

- Customer ID
- Customer Name
- City
- Signup Time
- Acquisition Channel

---

## 🍴 Restaurants

- Restaurant ID
- Restaurant Name
- Cuisine
- City
- Average Rating

---

# 🛠️ Tools & Technologies

- Microsoft Power BI
- Power Query
- DAX (Data Analysis Expressions)
- Microsoft Excel
- Data Modeling
- Git
- GitHub

---

# 📊 Data Model

The dashboard follows a **Star Schema** data model.

```
              Customers
                  │
                  │
Restaurants ─── Orders ─── Date
```

### Relationships

- Customers ➜ Orders
- Restaurants ➜ Orders
- Date ➜ Orders

---

# 📈 Dashboard Pages

## 📄 Page 1 — Executive Overview

A high-level summary of business performance.

### KPIs

- Total Revenue
- Total Orders
- Total Customers
- Average Order Value (AOV)
- Average Rating

### Visuals

- Monthly Revenue Trend
- Revenue by City
- Revenue by Cuisine
- Order Status Distribution

### Filters

- Year
- City
- Restaurant

---

## 📄 Page 2 — Revenue Analysis

Focused on understanding the causes of inconsistent revenue.

### KPIs

- Total Revenue
- Total Orders
- Average Order Value
- Cancellation Rate

### Visuals

- Monthly Revenue Trend
- Revenue by Restaurant
- Revenue by City
- Revenue vs Discount Analysis

### Business Insights

- Monthly revenue fluctuations
- Revenue contribution by restaurants
- Revenue comparison across cities
- Impact of discounts on revenue

---

## 📄 Page 3 — Restaurant Performance

Focused on identifying underperforming restaurants.

### KPIs

- Total Restaurants
- Average Rating
- Average Revenue per Restaurant
- Average Orders per Restaurant

### Visuals

- Top 10 Restaurants by Revenue
- Bottom 10 Restaurants by Revenue
- Revenue by Cuisine (Donut Chart)
- Restaurant Ratings Analysis

### Business Insights

- Best-performing restaurants
- Lowest-performing restaurants
- Cuisine-wise performance
- Restaurant rating comparison

---

# 📌 DAX Measures Created

- Total Revenue
- Total Orders
- Total Customers
- Total Restaurants
- Average Order Value (AOV)
- Cancellation Rate
- Average Revenue per Restaurant
- Average Orders per Restaurant

---

# 📊 Key Insights

## Revenue Analysis

- Revenue fluctuates across different months.
- Certain cities contribute significantly more revenue than others.
- Restaurant performance varies across locations.
- Discounts influence revenue trends but are not the sole factor affecting revenue.

## Restaurant Performance

- A small number of restaurants contribute the majority of total revenue.
- Some restaurants consistently underperform.
- Cuisine preferences differ across cities.
- Restaurant ratings provide additional insights into overall performance.

---

# ✨ Features

- Interactive dashboard navigation
- Dynamic slicers and filters
- Responsive KPI cards
- Interactive visualizations
- Business-focused insights
- Clean and user-friendly interface

---

# 📷 Dashboard Preview

## 🖥️ Page 1 — Executive Overview


<img width="712" height="411" alt="image" src="https://github.com/user-attachments/assets/336e907b-8e5e-426a-a9fe-7e979892a80c" />


---

## 📊 Page 2 — Revenue Analysis


<img width="700" height="406" alt="image" src="https://github.com/user-attachments/assets/77fb49cd-732d-4623-864e-b314011456c4" />


---

## 🍽️ Page 3 — Restaurant Performance


<img width="815" height="475" alt="image" src="https://github.com/user-attachments/assets/d1ea81a1-ecbd-45ff-a235-f8f1b983d342" />

---

# 📁 Repository Structure

```
Zomato_data_analysis/
│
├── README.md
├── LICENSE
├── requirements.txt
│
├── Datasets/
│   ├── cleaned_Customers.csv
│   ├── cleaned_Orders.csv
│   ├── cleaned_Restaurants.csv
│   └── zomato.xlsx
│
├── Python_EDA/
│   ├── Zomato_data_analysis.ipynb
│   └── images/
│
├── SQL_Analysis/
│   │
│   ├── Problem-1_Revenue_Inconsistency/
│   │   ├── Hypothesis-1_Order_Volume.sql
│   │   ├── Hypothesis-2_Average_Order_Value.sql
│   │   ├── Hypothesis-3_Cancelled_Orders.sql
│   │   └── Hypothesis-4_Discounts.sql
│   │
│   └── Problem-2_Restaurant_Performance/
│       ├── Hypothesis-1_Ratings.sql
│       ├── Hypothesis-2_Cancellations.sql
│       └── Hypothesis-3_Cuisine_City.sql
│
├── PowerBI_Dashboards/
│   └── Zomato_Dashboard.pbix
│
├── Reports/
│   └── Final_Conclusion_Report.docx
│
└── Assets/
    ├── Dashboard_Overview.png
    ├── Revenue_Dashboard.png
    ├── Restaurant_Dashboard.png
    └── SQL_Analysis.png
---

# 🚀 Future Improvements

- Add revenue forecasting
- Build customer acquisition and retention dashboard
- Add drill-through reports
- Publish dashboard to Power BI Service
- Implement Row-Level Security (RLS)

---

# 📚 Learning Outcomes

Through this project, I gained hands-on experience in:

- Data cleaning and transformation using Power Query
- Building a Star Schema data model
- Creating DAX measures and calculated columns
- Designing interactive Power BI dashboards
- Developing business KPIs
- Applying data visualization best practices
- Converting raw business data into actionable insights

---

# 👨‍💻 Author

## **Pyata Preetham**

🎓 BCA Student  
📊 Aspiring Data Analyst / Business Intelligence Analyst

### Skills

- Power BI
- SQL
- Python
- Excel
- DAX
- Power Query

---

## ⭐ If you found this project helpful, consider giving it a Star on GitHub!
