--revenue generated each year--
with hotels as(
select * from dbo.['2018$']
union 
select * from dbo.['2019$']
union
select * from dbo.['2020$'])
select arrival_date_year,hotel,
round(sum((stays_in_week_nights+stays_in_weekend_nights)*adr),2) as revenue
from hotels
group by arrival_date_year,hotel

--joining tables--
with hotels as(
select * from dbo.['2018$']
union 
select * from dbo.['2019$']
union
select * from dbo.['2020$'])
select*from hotels
left join dbo.market_segment$ 
on hotels.market_segment=market_segment$.market_segment
left join dbo.meal_cost$
on hotels.meal=meal_cost$.meal
