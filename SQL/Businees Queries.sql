CREATE DATABASE retail_project;
USE retail_project;

select region, round(sum(sales),2) as total_sales
from retail
group by region
order by total_sales desc;

select region, round(sum(profit),2) as total_profit
from retail
group by region 
order by total_profit desc;

select
    region,
    category,
    ROUND(SUM(sales),2) as total_sales,
    ROUND(SUM(profit),2) as total_profit
from retail
group by region, category
order by region, total_profit asc;

SELECT
    region,
    ROUND(SUM(profit),2) AS total_profit,
    RANK() OVER(ORDER BY SUM(profit) DESC) AS profit_rank
FROM retail
GROUP BY region;

SELECT
    category,
    ROUND(SUM(profit),2) AS total_profit
FROM retail
GROUP BY category
HAVING SUM(profit) > 50000;

select region,ROUND(SUM(profit), 2) as total_profit,
    case
        when SUM(profit) > 80000 then 'High Profit'
        when SUM(profit) >= 40000 then 'Medium Profit'
        else 'Low Profit'
    end as performance
from retail
group by region
order by total_profit DESC;

with region_profit as (
     select region, round(sum(profit),2) as total_profit
     from retail
     group by region 
)
select region, total_profit
from region_profit 
where total_profit > (
	  select avg(total_profit)
      from region_profit
);

select * from retail;



