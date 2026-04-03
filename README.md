
# 🌍 World Layoffs Data Analysis (SQL Project)
📌 Project Overview

This project focuses on analyzing global layoff trends using SQL. It covers the complete data analysis pipeline — from data cleaning to exploratory data analysis (EDA) — using a real-world dataset of layoffs across different companies, industries, and countries.

The goal is to transform raw, inconsistent data into meaningful insights that help understand:

📉 Layoff trends over time
🌎 Country-wise and industry-wise impact
🏢 Companies with the highest layoffs
📊 Patterns in funding, growth stage, and layoffs
⚙️ Tools & Technologies

MySQL
SQL Window Functions
CTEs (Common Table Expressions)
Data Cleaning Techniques
Exploratory Data Analysis (EDA)

🧹 Phase 1: Data Cleaning
The raw dataset contained inconsistencies, duplicates, and missing values. This phase ensures data quality and reliability.

🔧 Key Steps Performed:
1. Creating Staging Tables
Created layoffs_staging and layoffs_staging2 to safely clean and transform data without modifying the original dataset.
2. Removing Duplicates
Used ROW_NUMBER() with PARTITION BY to identify duplicate rows.
Deleted duplicates while preserving unique records.
3. Standardizing Data
Trimmed extra spaces in company names.
Unified inconsistent values (e.g., Crypto-related industries grouped together).
Cleaned country names (e.g., removed trailing periods).
Converted date column from text → proper DATE format.
4. Handling Missing Values
Removed rows where both total_laid_off and percentage_laid_off were NULL.
Replaced blank values with NULLs.
Filled missing industries using self-joins based on company names.
5. Final Cleanup
Dropped unnecessary columns like row_num.
Ensured dataset is structured and analysis-ready.

📊 Phase 2: Exploratory Data Analysis (EDA)
After cleaning, SQL queries were used to extract insights and identify trends.

🔍 Key Analysis Performed:
📌 Overall Layoff Insights
Maximum layoffs and percentage layoffs
Companies with 100% layoffs

🏢 Company-Level Analysis
Total layoffs by company
Average percentage layoffs per company
Year-wise layoffs per company
Top 5 companies with highest layoffs per year (using DENSE_RANK())

🌎 Geographic Analysis
Layoffs by country
🏭 Industry Analysis
Layoffs by industry
📅 Time-Based Trends
Layoffs by year
Monthly layoffs trends
Rolling total of layoffs over time
🚀 Business Stage Analysis
Layoffs based on company growth stage (Startup, IPO, etc.)

📈 Key Insights
A few companies contributed disproportionately to total layoffs.
The Tech and Crypto industries showed significant volatility.
Layoffs peaked during specific years, indicating economic downturns.
The United States had the highest number of layoffs.
Startups and late-stage companies were heavily impacted.
Rolling trends reveal waves of layoffs rather than constant decline.

📂 Project Structure
📁 World-Layoffs-SQL-Project
│
├── Data_Cleaning_SQL_Project.sql   # Data cleaning queries
├── EDA_Project.sql                # Exploratory data analysis queries
└── README.md                      # Project documentation

🚀 How to Use
Import the dataset into MySQL
Run the Data Cleaning SQL file first
Then execute the EDA SQL file
Modify queries to explore deeper insights

💡 Skills Demonstrated
Data Cleaning & Transformation
SQL Window Functions
Analytical Thinking
Business Insight Generation
Real-world Data Handling

🤝 Let's Connect
If you found this project useful or want to collaborate:

💼 LinkedIn: https://www.linkedin.com/in/hanzalaraja/
📧 Email: hanzala.analyst@gmail.com

⭐ Support
If you like this project, don’t forget to star ⭐ the repository and share your feedback!
