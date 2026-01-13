-- database creation
CREATE TABLE IF NOT EXISTS sales_teams (
    agent_id INT PRIMARY KEY,
    sales_agent VARCHAR(100) NOT NULL,
    manager VARCHAR(100),
    regional_office VARCHAR(20)
);


CREATE TABLE IF NOT EXISTS products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(25) NOT NULL,
    series VARCHAR(10) NOT NULL,
    sales_price INT NOT NULL
);


CREATE TABLE IF NOT EXISTS accounts (
    account_id INT PRIMARY KEY,
    account_name VARCHAR(255) NOT NULL,
    sector VARCHAR(100) NOT NULL,
    year_established INT,
    revenue NUMERIC,
    employees INT,
    office_location VARCHAR(100),
    subsidiary_of VARCHAR(255)
);


CREATE TABLE IF NOT EXISTS sales_pipeline (
    opportunity_id VARCHAR(8) PRIMARY KEY,
    agent_id INT REFERENCES sales_teams(agent_id),
    product_id INT REFERENCES products(product_id),
    account_id INT REFERENCES accounts(account_id),
    deal_stage VARCHAR(50),
    engage_date DATE,
    close_date DATE,
    close_value NUMERIC
);

---------------------------------------------------------------------------------------------------

COPY sales_teams
FROM 'C:\Program Files\PostgreSQL\17\Data_Preparation\modified_files\sales_teams.csv'
DELIMITER ','
CSV HEADER
QUOTE '"';

SELECT * FROM sales_teams LIMIT 5;


COPY products
FROM 'C:\Program Files\PostgreSQL\17\Data_Preparation\modified_files\products.csv'
DELIMITER ','
CSV HEADER
QUOTE '"';

SELECT * FROM products LIMIT 5;

COPY accounts (account_id, account_name, sector, year_established, revenue, employees, office_location, subsidiary_of)
FROM 'C:\Program Files\PostgreSQL\17\Data_Preparation\modified_files\accounts.csv'
DELIMITER ','
CSV HEADER
QUOTE '"'
NULL '';

SELECT * FROM accounts LIMIT 5;


COPY sales_pipeline (opportunity_id, agent_id, product_id, account_id, deal_stage, engage_date, close_date, close_value)
FROM 'C:\Program Files\PostgreSQL\17\Data_Preparation\modified_files\sales_pipeline.csv'
DELIMITER ','
CSV HEADER
QUOTE '"'
NULL '';

SELECT * FROM sales_pipeline LIMIT 5;
