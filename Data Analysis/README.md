# 📊 Sales Performance & Opportunity Analysis

This repository presents a detailed analysis of sales performance across teams, agents, products, sectors, and time periods.  
The objective is to identify strengths, inefficiencies, trends, and actionable insights from historical sales data.

---

## 🏢 Sales Team Performance

There are **six distinct sales teams**, defined by a unique combination of **regional office** and **manager**.

### 1. What is the sales volume and the number of won opportunities for each sales team?

| Regional Office | Manager           | Won Opportunities | Revenue   |
|-----------------|-------------------|-------------------|-----------|
| Central         | Melvin Marxen     | 882               | 2,251,930 |
| West            | Summer Sewald     | 828               | 1,964,750 |
| East            | Rocco Neubert     | 691               | 1,960,545 |
| West            | Celia Rouche      | 610               | 1,603,897 |
| East            | Cara Losch        | 480               | 1,130,049 |
| Central         | Dustin Brinkmann  | 747               | 1,094,363 |

**Insight:**  
High deal volume does not always correlate with efficiency. Some teams prioritize quantity, while others excel at conversion quality.

---

### 2. Which sales teams have the highest success rate in closing deals?

| Regional Office | Manager          | Success Rate (%) |
|-----------------|------------------|------------------|
| West            | Summer Sewald     | 64.34            |
| West            | Celia Rouche      | 63.41            |
| Central         | Dustin Brinkmann  | 62.98            |
| Central         | Melvin Marxen     | 62.20            |
| East            | Rocco Neubert     | 62.08            |

The **East team led by Cara Losch** achieves the highest success rate, indicating strong opportunity qualification and deal execution.

---

## 👤 Identification of Underperforming Sales Agents

### 1. Which sales agents have the lowest performance in terms of sales volume and won opportunities?

| Regional Office | Manager         | Sales Agent        |
|-----------------|-----------------|--------------------|
| Central         | Melvin Marxen   | Mei-Mei Johns      |
| East            | Cara Losch      | Elizabeth Anderson |
| East            | Rocco Neubert   | Natalya Ivanova    |
| West            | Celia Rouche    | Carol Thompson     |
| West            | Summer Sewald   | Carl Lin           |

These cases may represent onboarding phases, role transitions, or missing data.

---

### 🔹 Lowest Performers by Revenue

| Sales Agent      | Revenue  | Revenue Rank |
|------------------|----------|--------------|
| Violet Mclelland | 123,431  | 30           |
| Wilburn Farren   | 157,640  | 29           |
| Niesha Huffines  | 176,961  | 28           |

---

### 🔹 Lowest Performers by Won Opportunities

| Sales Agent     | Won Opportunities | Won Opp Rank |
|-----------------|-------------------|--------------|
| Wilburn Farren  | 55                | 30           |
| Rosalina Dieter | 72                | 29           |
| Garret Kinder   | 75                | 28           |

Low revenue and low deal count do not always overlap, highlighting differences in deal size and pricing.

---

### 2. What is the individual success rate of each sales agent, and how does it compare to the team average?


| Regional Office | Manager         | Sales Agent        | Revenue  | Lowest Sales Performance? | Won Opp | Lowest Won Opp Performance? |
|-----------------|-----------------|--------------------|----------|---------------------------|---------|----------------------------|
| Central         | Dustin Brinkmann | Versie Hillebrand  | 187,693  | Yes                       | 176     | No                         |
| Central         | Dustin Brinkmann | Cecily Lampkin     | 229,800  | No                        | 107     | Yes                        |
| Central         | Melvin Marxen    | Niesha Huffines    | 176,961  | Yes                       | 105     | Yes                        |
| East            | Cara Losch       | Violet Mclelland   | 123,431  | Yes                       | 122     | No                         |
| East            | Cara Losch       | Wilburn Farren     | 157,640  | No                        | 55      | Yes                        |
| East            | Rocco Neubert    | Boris Faz          | 261,631  | Yes                       | 101     | Yes                        |
| West            | Celia Rouche     | Rosalina Dieter    | 235,403  | Yes                       | 72      | Yes                        |
| West            | Summer Sewald    | Kami Bicknell      | 316,456  | Yes                       | 174     | No                         |
| West            | Summer Sewald    | James Ascencio     | 413,533  | No                        | 135     | Yes                        |

---

## 🎯 Individual vs Team Success Rate

Comparison of individual agent success rates against **Dustin Brinkmann’s team average (62.98%)**.

| Regional Office | Manager         | Sales Agent        | Agent's Success Rate | Team's Success Rate | Description        |
|-----------------|-----------------|--------------------|----------------------|---------------------|--------------------|
| Central         | Dustin Brinkmann | Anna Snelling      | 61.90                | 62.98               | Below Team Average |
| Central         | Dustin Brinkmann | Cecily Lampkin     | 66.88                | 62.98               | Above Team Average |
| Central         | Dustin Brinkmann | Lajuana Vencill    | 54.98                | 62.98               | Below Team Average |
| Central         | Dustin Brinkmann | Moses Frase        | 66.15                | 62.98               | Above Team Average |
| Central         | Dustin Brinkmann | Versie Hillebrand  | 66.67                | 62.98               | Above Team Average |

Some agents demonstrate high efficiency even without leading in total revenue.

---

## 📈 Quarterly Performance Trends

**Sales Period:** March 2017 to December 2017

### 1. What are the quarter-over-quarter sales trends in terms of won opportunities and sales volume?

| Quarter | Won Opp | QoQ Won Opp Growth (%) | Sales ($) | QoQ Sales Growth (%) |
|---------|---------|------------------------|-----------|----------------------|
| 1       | 531     |                        | 1,134,672 |                      |
| 2       | 1,254   | 136.16                 | 3,086,111 | 171.98               |
| 3       | 1,257   | 0.24                   | 2,982,255 | -3.37                |
| 4       | 1,196   | -4.85                  | 2,802,496 | -6.03                |

---

### 2. How do success rates for sales opportunities vary by quarter?

| Quarter | Success Rate (%) | QoQ Variation (%) |
|---------|------------------|------------------|
| 1       | 82.07            |                  |
| 2       | 61.71            | -24.81           |
| 3       | 61.41            | -0.49            |
| 4       | 60.25            | -1.89            |

Early quarters focused on higher-probability deals, while later quarters reflect a broader pipeline.

---

## 📦 Product Performance

### 1. Which products have the highest success rates in closing deals?

| Product        | Success Rate (%) |
|----------------|------------------|
| MG Special     | 64.84            |
| GTX Plus Pro   | 64.30            |
| GTX Basic      | 63.72            |
| GTX Pro        | 63.56            |
| GTX Plus Basic | 62.13            |
| MG Advanced    | 60.33            |
| GTK 500        | 60.00            |

---

### 2. Which products generate the most revenue, and how do they compare to other products?

| Product        | Revenue ($) | Revenue Share (%) |
|----------------|-------------|-------------------|
| GTX Pro        | 3,510,578   | 35.09             |
| GTX Plus Pro   | 2,629,651   | 26.28             |
| MG Advanced    | 2,216,387   | 22.15             |
| GTX Plus Basic | 705,275     | 7.05              |
| GTX Basic      | 499,263     | 4.99              |
| GTK 500        | 400,612     | 4.00              |
| MG Special     | 43,768      | 0.44              |

---

## 🏭 Sector Performance

### 1. Which sectors generate the most revenue and have the highest success rates?

| Sector     | Revenue ($) | Success Rate (%) |
|------------|-------------|------------------|
| Retail     | 1,867,528   | 63.06            |
| Technology | 1,515,487   | 63.42            |
| Medical    | 1,359,595   | 62.32            |

---

### 🔹 Highest Success Rate Sectors

| Sector        | Revenue ($) | Success Rate (%) |
|---------------|-------------|------------------|
| Marketing     | 922,321     | 64.85            |
| Entertainment | 689,007     | 64.68            |
| Software      | 1,077,934   | 63.92            |

---

### 2. What is the distribution of opportunities by sector?

| Sector      | Won | Lost | Engaging | Prospecting | Total | Win Rate (%) | Win/Loss Ratio |
|-------------|-----|------|----------|-------------|-------|--------------|----------------|
| Retail      | 799 | 468  | 94       | 36          | 1,397 | 57.19        | 1.71           |
| Technology  | 671 | 387  | 71       | 36          | 1,165 | 57.60        | 1.73           |
| Medical     | 592 | 358  | 77       | 24          | 1,051 | 56.33        | 1.65           |
| Software    | 450 | 254  | 43       | 10          | 757   | 59.45        | 1.77           |
| Marketing   | 404 | 219  | 40       | 11          | 674   | 59.94        | 1.84           |

---

## ⏱ Sales Cycle Duration

### 1. What is the average sales cycle duration for won and lost opportunities?

| Deal Stage | Avg Sales Cycle Days | Max Sales Cycle Days | Min Sales Cycle Days |
|------------|----------------------|----------------------|----------------------|
| Won        | 52                   | 138                  | 1                    |
| Lost       | 41                   | 138                  | 1                    |

---

### 2. How does the sales cycle duration vary by product or sector?

| Product        | Avg Won Sales Cycle Days | Avg Lost Sales Cycle Days |
|----------------|---------------------------|---------------------------|
| GTX Pro        | 48                        | 41                        |
| MG Special     | 51                        | 43                        |
| GTX Plus Pro   | 52                        | 36                        |
| MG Advanced    | 52                        | 40                        |
| GTX Plus Basic | 52                        | 46                        |
| GTX Basic      | 55                        | 41                        |
| GTK 500        | 64                        | 38                        |

---

### 🔹 Sales Cycle by Sector

| Sector        | Avg Won Sales Cycle Days | Avg Lost Sales Cycle Days |
|---------------|---------------------------|---------------------------|
| Marketing     | 49                        | 41                        |
| Entertainment | 51                        | 47                        |
| Medical       | 52                        | 38                        |
| Technology    | 52                        | 39                        |
| Services      | 52                        | 39                        |

---

## ✅ Summary

This analysis highlights how performance varies across teams, individuals, products, and sectors. It shows that efficiency, not just volume, plays a major role in long-term sales success.

