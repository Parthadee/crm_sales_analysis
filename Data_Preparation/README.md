# 🧹 Data Preparation

The data preparation phase focused on understanding the raw datasets, cleaning inconsistencies, and transforming the data to support efficient querying and accurate analysis.

---

## 🔍 Data Examination

At the start of the project, I reviewed the  
**.csv file**, which were provided in CSV format.
- [**Data (.csv)**](https://github.com/Parthadee/crm-sales-opportunities-analysis/tree/bc7831e59ad22c5ba2b75d4300c6d67faf683e43/Data_Preparation/original_files)
  
Below is a summary of the fields available in each file.

---

### 📁 `accounts.csv`

Contains information about companies involved in sales opportunities.

- **account**: Company name  
- **sector**: Industry sector  
- **year_established**: Year the company was founded  
- **revenue**: Annual revenue (in millions USD)  
- **employees**: Number of employees  
- **office_location**: Headquarters location  
- **subsidiary_of**: Parent company, if applicable  

---

### 👥 `sales_teams.csv`

Provides details about sales agents and their management structure.

- **sales_agent**: Name of the sales agent  
- **manager**: Sales manager name  
- **regional_office**: Regional office location  

---

### 🧾 `products.csv`

Contains information about the company’s computer hardware products.

- **product**: Product name  
- **series**: Product series or family  
- **sales_price**: Suggested retail price  

---

### 📊 `sales_pipeline.csv`

Stores detailed records for each sales opportunity.

- **opportunity_id**: Unique identifier for each opportunity  
- **sales_agent**: Sales agent handling the deal  
- **product**: Product involved  
- **account**: Company involved  
- **deal_stage**: Pipeline stage (Prospecting, Engaging, Won, Lost)  
- **engage_date**: Date when the deal entered the Engaging stage  
- **close_date**: Date when the deal was closed  
- **close_value**: Revenue generated from the deal  

---

## 🔗 ID Standardization

Originally, the `sales_pipeline.csv` file stored **full names** for sales agents, products, and accounts.

To improve performance and consistency:

- Integer **ID columns** were added to:
  - `accounts.csv`
  - `sales_teams.csv`
  - `products.csv`
- The full-name values in `sales_pipeline.csv` were replaced with their corresponding IDs.

This change improves:
- Join performance in SQL queries  
- Data consistency across files  
- Long-term scalability of the database  

---

## 🔄 Data Transformation Steps

To prepare the data for analysis and database loading, the following steps were performed:

1. **Add ID columns**  
   Unique identifier columns were added to dimension files and referenced in `sales_pipeline.csv`.

2. **Create mapping dictionaries**  
   Dictionaries were created to map IDs to full names for products, accounts, and sales agents.

3. **Validate data consistency**  
   The dictionaries were cross-checked against `sales_pipeline.csv` to detect mismatches.

4. **Correct misspellings**  
   Any misspelled values were fixed to ensure consistent replacements.

5. **Replace names with IDs**  
   Full names in `sales_pipeline.csv` were replaced with their respective IDs.

6. **Save transformed data**  
   The updated files were saved and prepared for downstream processing.

---

## ⚠️ Handling Missing Values

The following columns contained empty string values that required attention:

- **accounts.csv**
  - `subsidiary_of`

- **sales_pipeline.csv**
  - `account`
  - `engage_date`
  - `close_date`
  - `close_value`

These were handled carefully during transformation and later converted to `NULL` values during database loading.

---

## 🧰 Tools & Outputs

### 🐍 Transformation Tool

The entire data preparation process was automated using Python in a Jupyter Notebook:

- [**csv files preparation**](https://github.com/Parthadee/crm-sales-opportunities-analysis/blob/bc7831e59ad22c5ba2b75d4300c6d67faf683e43/Data_Preparation/Analysis%20Sales_CRM.ipynb)

---

## ✅ Outcome

After data preparation:
- All datasets are standardized using IDs  
- Naming inconsistencies are resolved  
- Missing values are clearly identified  
- The data is optimized for database loading and analytics  

This ensures a clean and reliable foundation for data modeling and analysis.
