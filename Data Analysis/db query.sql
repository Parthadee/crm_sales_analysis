-- SALES TEAM PERFORMANCE
/* 1) What is the sales volume and the number of won opportunities for each sales team?*/

SELECT
    st.regional_office AS teams_regional_office,
    st.manager AS teams_manager,
    COUNT(*) AS won_opportunities,
    SUM(sp.close_value) AS sales_revenue
FROM sales_pipeline sp
JOIN sales_teams st ON sp.agent_id = st.agent_id
WHERE sp.deal_stage = 'Won'
GROUP BY st.regional_office, st.manager
ORDER BY sales_revenue DESC;


/*  2) Which sales teams have the highest success rate in closing deals?  */

SELECT
    st.regional_office AS teams_regional_office,
    st.manager AS teams_manager,
    ROUND(
        (
            SUM(CASE WHEN sp.deal_stage = 'Won' THEN 1 ELSE 0 END)::numeric /
            NULLIF(SUM(CASE WHEN sp.deal_stage IN ('Won','Lost') THEN 1 ELSE 0 END), 0)
        ) * 100,
        2
    ) AS success_rate_pct
FROM sales_pipeline sp
JOIN sales_teams st ON sp.agent_id = st.agent_id
GROUP BY st.regional_office, st.manager
ORDER BY success_rate_pct DESC;


-- IDENTIFICATION OF UNDERPERFORMING SALES AGENTS 
/* 1) Which sales agents have the lowest performance in terms of sales volume and won opportunities? */

SELECT
    st.regional_office,
    st.manager,
    st.sales_agent
FROM sales_teams st
WHERE NOT EXISTS (
    SELECT 1
    FROM sales_pipeline sp
    WHERE sp.agent_id = st.agent_id
);

/* 2) What is the individual success rate of each sales agent, and how does it compare to the team success rate? */

 SELECT
    st.sales_agent,
    SUM(sp.close_value) AS sales_revenue,
    DENSE_RANK() OVER (ORDER BY SUM(sp.close_value) DESC) AS revenue_rank,
    COUNT(*) AS won_opportunities,
    RANK() OVER (ORDER BY COUNT(*) DESC) AS won_opportunities_rank
FROM sales_pipeline sp
JOIN sales_teams st ON sp.agent_id = st.agent_id
WHERE sp.deal_stage = 'Won'
GROUP BY st.sales_agent
ORDER BY sales_revenue ASC, won_opportunities ASC;


-- QUARTERLY TRENDS
/* 1) What are the quarter-over-quarter sales trends in terms of won opportunities and sales volume? */

WITH ranked_sales_agents AS (
    SELECT
        st.regional_office AS teams_regional_office,
        st.manager AS teams_manager,
        st.sales_agent,
        SUM(sp.close_value) AS sales_revenue,
        DENSE_RANK() OVER (
            PARTITION BY st.regional_office, st.manager
            ORDER BY SUM(sp.close_value) ASC
        ) AS sales_rank_asc,
        COUNT(*) AS won_opportunities,
        DENSE_RANK() OVER (
            PARTITION BY st.regional_office, st.manager
            ORDER BY COUNT(*) ASC
        ) AS opp_rank_asc
    FROM sales_pipeline sp
    JOIN sales_teams st ON sp.agent_id = st.agent_id
    WHERE sp.deal_stage = 'Won'
    GROUP BY st.regional_office, st.manager, st.sales_agent
)
SELECT
    teams_regional_office,
    teams_manager,
    sales_agent,
    sales_revenue,
    CASE WHEN sales_rank_asc = 1 THEN 'Yes' ELSE 'No' END AS lowest_sales_performance,
    won_opportunities,
    CASE WHEN opp_rank_asc = 1 THEN 'Yes' ELSE 'No' END AS lowest_opportunities_performance
FROM ranked_sales_agents
WHERE sales_rank_asc = 1 OR opp_rank_asc = 1
ORDER BY teams_regional_office, teams_manager, sales_revenue;


/* 2) How do success rates for sales opportunities vary by quarter? */

WITH quarter_sales_deals AS (
    SELECT
        EXTRACT(QUARTER FROM close_date) AS quarter,
        SUM(CASE WHEN deal_stage = 'Won' THEN 1 ELSE 0 END) AS won_deals,
        SUM(CASE WHEN deal_stage IN ('Won','Lost') THEN 1 ELSE 0 END) AS won_lost_deals
    FROM sales_pipeline
    WHERE close_date IS NOT NULL
    GROUP BY EXTRACT(QUARTER FROM close_date)
),
qoq_success_rate AS (
    SELECT
        quarter,
        won_deals::numeric / NULLIF(won_lost_deals, 0) AS success_rate,
        LAG(won_deals::numeric / NULLIF(won_lost_deals, 0))
            OVER (ORDER BY quarter) AS prev_success_rate
    FROM quarter_sales_deals
)
SELECT
    quarter,
    ROUND(success_rate * 100, 2) AS success_rate_pct,
    ROUND(
        ((success_rate - prev_success_rate) / NULLIF(prev_success_rate, 0)) * 100,
        2
    ) AS qoq_success_rate_growth_pct
FROM qoq_success_rate
ORDER BY quarter;


-- PRODUCT SUCCESS RATE
/* 1) Which products have the highest success rates in closing deals? */

SELECT
    p.product_name,
    ROUND(
        (
            SUM(CASE WHEN sp.deal_stage = 'Won' THEN 1 ELSE 0 END)::numeric /
            NULLIF(SUM(CASE WHEN sp.deal_stage IN ('Won','Lost') THEN 1 ELSE 0 END), 0)
        ) * 100,
        2
    ) AS success_rate_pct
FROM sales_pipeline sp
JOIN products p
    ON sp.product_id = p.product_id
GROUP BY p.product_name
ORDER BY success_rate_pct DESC;

/* 2) Which products generate the most revenue, and how do they compare to other products? */

WITH product_revenue AS (
    SELECT
        p.product_name,
        SUM(sp.close_value) AS sales_revenue
    FROM sales_pipeline sp
    JOIN products p
        ON sp.product_id = p.product_id
    WHERE sp.deal_stage = 'Won'
    GROUP BY p.product_name
)
SELECT
    product_name,
    sales_revenue,
    ROUND(
        (sales_revenue / SUM(sales_revenue) OVER ()) * 100,
        2
    ) AS revenue_pct
FROM product_revenue
ORDER BY sales_revenue DESC;

-- SECTOR PERFORMANCE
/* 1) Which sectors generate the most revenue and have the highest success rates? */

SELECT
    a.sector,
    SUM(CASE WHEN sp.deal_stage = 'Won' THEN sp.close_value ELSE 0 END) AS sales_revenue,
    ROUND(
        (
            SUM(CASE WHEN sp.deal_stage = 'Won' THEN 1 ELSE 0 END)::numeric /
            NULLIF(SUM(CASE WHEN sp.deal_stage IN ('Won','Lost') THEN 1 ELSE 0 END), 0)
        ) * 100,
        2
    ) AS success_rate_pct
FROM sales_pipeline sp
JOIN accounts a
    ON sp.account_id = a.account_id
GROUP BY a.sector
ORDER BY sales_revenue DESC, success_rate_pct DESC;

/* 2) What is the distribution of opportunities by sector? */

SELECT
    a.sector,
    SUM(CASE WHEN sp.deal_stage = 'Won' THEN 1 ELSE 0 END) AS won,
    SUM(CASE WHEN sp.deal_stage = 'Lost' THEN 1 ELSE 0 END) AS lost,
    SUM(CASE WHEN sp.deal_stage = 'Engaging' THEN 1 ELSE 0 END) AS engaging,
    SUM(CASE WHEN sp.deal_stage = 'Prospecting' THEN 1 ELSE 0 END) AS prospecting,
    COUNT(*) AS total_opportunities,
    ROUND(
        (SUM(CASE WHEN sp.deal_stage = 'Won' THEN 1 ELSE 0 END)::numeric / COUNT(*)) * 100,
        2
    ) AS win_rate_pct,
    ROUND(
        SUM(CASE WHEN sp.deal_stage = 'Won' THEN 1 ELSE 0 END)::numeric /
        NULLIF(SUM(CASE WHEN sp.deal_stage = 'Lost' THEN 1 ELSE 0 END), 0),
        2
    ) AS win_loss_ratio
FROM sales_pipeline sp
JOIN accounts a
    ON sp.account_id = a.account_id
GROUP BY a.sector
ORDER BY won DESC;


-- SALES CYCLE DURATION
/* 1) What is the average sales cycle duration for won and lost opportunities? */

SELECT
    deal_stage,
    ROUND(AVG(close_date - engage_date)) AS avg_sales_cycle_days,
    MAX(close_date - engage_date) AS max_sales_cycle_days,
    MIN(close_date - engage_date) AS min_sales_cycle_days
FROM sales_pipeline
WHERE deal_stage IN ('Won','Lost')
GROUP BY deal_stage;

/* 2) How does the sales cycle duration vary by product or sector? */

/*Product*/
SELECT
    p.product_name,
    ROUND(AVG(CASE WHEN sp.deal_stage = 'Won' THEN sp.close_date - sp.engage_date END)) AS avg_won_sales_cycle_days,
    ROUND(AVG(CASE WHEN sp.deal_stage = 'Lost' THEN sp.close_date - sp.engage_date END)) AS avg_lost_sales_cycle_days
FROM sales_pipeline sp
JOIN products p ON sp.product_id = p.product_id
GROUP BY p.product_name
ORDER BY avg_won_sales_cycle_days, avg_lost_sales_cycle_days;

/*Sector*/
SELECT
    a.sector,
    ROUND(AVG(CASE WHEN sp.deal_stage = 'Won' THEN sp.close_date - sp.engage_date END)) AS avg_won_sales_cycle_days,
    ROUND(AVG(CASE WHEN sp.deal_stage = 'Lost' THEN sp.close_date - sp.engage_date END)) AS avg_lost_sales_cycle_days
FROM sales_pipeline sp
JOIN accounts a ON sp.account_id = a.account_id
GROUP BY a.sector
ORDER BY avg_won_sales_cycle_days, avg_lost_sales_cycle_days;

