
# 📊 Data Analysis Portfolio

*A comprehensive repository for SQL training, data cleaning, retail analytics, and bike‑sales visualisation.*

***

## 📁 Project Structure

```
project/
│── data/
│   ├── student.csv
│   ├── world db.sql
│   ├── script examples.sql
│   ├── Country Language.sql
│   ├── country cleaning.sql
│   ├── city cleaning.sql
│   ├── retail_sales_dataset_Master.xlsx
│   ├── Day_3_Task_1_Bike_Sales_Pivot_Lab.xlsx
│   └── Day_3_Task_3_Bike_Sales_Visualisations_Lab.xlsx
│
│── Workbooks/
│   ├── Workbook_Excel.docx
│   ├── Workbook_Tableau,PowerBI.docx
│   ├── Workbook_SQL.docx
│   └── Workbook_Python.docx
│   
│── sql/
│   └── database_exercises.sql
│
└── README.md
```

***

# 📂 Datasets & Files

***

## 1️⃣ `student.csv`

Contains 35 student records with columns:

*   `id`, `name`, `class`, `mark`, `gender`

Perfect for:

*   Data cleaning
*   Handling missing values
*   Basic EDA

***

## 2️⃣ `world db.sql`

Comprehensive SQL queries for the **MySQL World Database**, including:

*   Listing all cities and countries
*   Selecting with aliases
*   Sorting and limiting results
*   Avg population queries
*   Cities starting with “New”, population > 2M
*   Joins to identify capitals and continents

Great for:

*   SQL fundamentals
*   Query optimisation
*   Joining multiple tables

***

## 3️⃣ `script examples.sql`

Advanced SQL examples such as:

*   RANK() window function
*   Multi‑column ordering
*   LIKE operators and patterns
*   Date filtering using YEAR(), MONTH(), DAY()
*   NULL logic correction (“IS NULL” vs “= NULL”)
*   Table creation, insertion, update, deletion
*   INNER JOIN and LEFT JOIN demonstrations
*   Subqueries for averages   


***

# 🧼 SQL Cleaning Scripts

***

## 4️⃣ `Country Language.sql`

Cleans & standardises the `countrylanguage` table:

*   Shows table structure
    ```sql
    SHOW CREATE TABLE countrylanguage;
    ```
*   Modifies `language` to ensure NOT NULL with default empty string
    ```sql
    ALTER TABLE countrylanguage
    MODIFY COLUMN language VARCHAR(30) NOT NULL DEFAULT '';
    ```
*   Counts NULLs in `percentage` column
    ```sql
    SELECT COUNT(*),
           SUM(CASE WHEN percentage IS NULL THEN 1 ELSE 0 END)
    FROM countrylanguage;
    ```
  
***

## 5️⃣ `country cleaning.sql`

Cleans the `country` table:

*   Structure inspection
    ```sql
    SHOW CREATE TABLE country;
    ```
*   Identify `IndepYear` nulls
*   Replace NULL HeadOfState with empty string
    ```sql
    UPDATE country
    SET HeadOfState = ""
    WHERE HeadOfState IS NULL;
    ```
*   Standardise `region` text column
 
***

## 6️⃣ `city cleaning.sql`

Cleans the `city` table:

*   Count rows and NULL IDs
*   Identify duplicate city names
*   Detect duplicate ID‑Name pairs
*   Fill missing `District` for ID = 921
*   Rename `Country_Code` → `CountryCode`    

***

# 🛍 Retail Sales Dataset

***

## 7️⃣ `retail_sales_dataset_Master.xlsx`

A large 2023 retail dataset containing:

*   800+ detailed transactions
*   Customer ID, Age, Gender, Generation
*   Product categories: Electronics, Clothing, Beauty
*   Quantities, unit prices, totals
*   Pre‑computed aggregates such as sum of transactions and average sales
  
Ideal for:

*   Customer segmentation
*   RFM analysis
*   Price optimisation
*   Retail dashboarding

***

# 🚴 Bike Sales Datasets

***

## 8️⃣ `Day_3_Task_1_Bike_Sales_Pivot_Lab.xlsx`

### **Sheet 1 – Pivot Table Overview**

*   Order quantities grouped by:
    *   Country (Australia, Canada, France, Germany, UK, US)
    *   Age Group
    *   Customer Gender
*   Example totals: Australia (63 orders), United States (66 orders)
  
### **Sheet 2 – Raw Bike Sales Data**

Includes fields:

*   Date, Day, Month, Year
*   Customer Age, Age Group
*   Country & State
*   Product Category & Sub‑Category
*   Unit Cost, Unit Price, Profit, Revenue  

Perfect for pivoting, grouping, and profit analysis.

***

## 9️⃣ `Day_3_Task_3_Bike_Sales_Visualisations_Lab.xlsx`

Large multi‑year dataset (2017+):

*   Country, State
*   Road & Mountain bike models
*   Customer demographics
*   Profit, cost, revenue
*   Ideal for time‑series charts and dashboards 

***

# 🧰 Tools & Technologies

*   **Python** → Pandas, NumPy, Seaborn, Matplotlib
*   **Jupyter Notebooks**
*   **SQL (MySQL)**
*   **Excel** (Analysis & Pivot Tables)
*   Optional: **Power BI**, **Tableau**, **Plotly**

***

# 🚀 Suggested Workflows

***

## 📌 SQL Learning Path

1.  Explore world database
2.  Run cleaning scripts
3.  Perform filtering, grouping, subqueries
4.  Use advanced script examples for joins & ranking

## 📌 Data Cleaning Path

1.  Clean `student.csv`
2.  Validate `city` / `country` / `countrylanguage` tables
3.  Create data dictionaries

## 📌 Bike Sales Analysis

*   Compare revenues across countries
*   Profitability by age group
*   Seasonal/Monthly trends
*   Build dashboards using cleaned datasets

## 📌 Retail Analytics

*   Customer behaviour modelling
*   Category margins
*   Yearly revenue patterns
*   Build RFM segmentation






