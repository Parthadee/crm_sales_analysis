# 🧱 Data Modelling

This project follows a **Star Schema** approach to structure sales data in a way that supports fast querying, clear relationships, and scalable analytics.

---

## ⭐ Star Schema Overview

The star schema is centered around a single **fact table** connected to multiple **dimension tables**.  
This design simplifies analysis while maintaining strong data integrity.

---

## 📊 Fact Table

### **sales_pipeline**

The fact table stores transactional sales data and connects to all supporting dimensions.

- **opportunity_id**  
  Primary Key (PK). Uniquely identifies each sales opportunity.

- **account_id**  
  Foreign Key (FK). Links to the `accounts` dimension and identifies the customer company.

- **agent_id**  
  Foreign Key (FK). Links to the `sales_teams` dimension and identifies the responsible sales agent.

- **product_id**  
  Foreign Key (FK). Links to the `products` dimension and identifies the product involved.

---

## 📁 Dimension Tables

Each dimension table has a **many-to-one relationship** with the fact table.  
Multiple opportunities can reference the same dimension record.

### **accounts**

- **account_id**  
  Primary Key (PK). Uniquely identifies each company or customer account.

---

### **sales_teams**

- **agent_id**  
  Primary Key (PK). Uniquely identifies each sales agent or team member.

---

### **products**

- **product_id**  
  Primary Key (PK). Uniquely identifies each product offered.

---

## 🛠 Database & Table Creation

The database was designed and implemented using **MySQL**, following best practices for relational modeling.

### Key steps included:

- **Table definition**  
  Created `sales_pipeline`, `accounts`, `sales_teams`, and `products` tables using SQL scripts with appropriate:
  - Data types  
  - Primary keys  
  - Foreign keys  
  - NOT NULL constraints

- **Relationship enforcement**  
  Foreign key constraints were applied to maintain referential integrity between the fact and dimension tables.

📄 SQL script used for schema creation:  
[**db_creation_crm_sales.sql**](https://github.com/Parthadee/crm-sales-opportunities-analysis/blob/b9b15643f7e1e36dd1cd04ab33ab8978331b2482/Data%20Modelling/db.sql)

---

## 📥 Data Loading

After creating the schema, the transformed data was loaded into the MySQL database.

### Process followed:

- **Data import**  
  Loaded cleaned and transformed data from the Data Preparation phase using SQL commands, ensuring correct column-to-table mapping.

- **Data integrity handling**  
  Empty string values identified earlier were converted to `NULL` to accurately represent missing data.

---

## ✅ Why This Model Works

- Simple and scalable structure  
- Optimized for analytical queries  
- Clear separation of facts and dimensions  
- Strong referential integrity  

This star schema provides a solid foundation for reporting, dashboarding, and advanced sales analytics.

The following Entity-Relationship Diagram (ERD) visually represents the star schema structure, providing a clear overview of the database architecture and the relationships between entities.

![db_crm_sales_diagram](https://github.com/user-attachments/assets/6e8e2d0b-350a-4952-a035-839b967d9247)
