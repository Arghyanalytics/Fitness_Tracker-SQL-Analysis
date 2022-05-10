create database Fitness_Tracker;
use Fitness_Tracker;


#1-Fitness Trackers Demand

select `Device Type`,count(*) as total
from fitness
group by `Device Type`;

#2-Number of Brands in the market

select count(Distinct `Brand Name`) as Total_Brands
from fitness;

#3-Brands with average Battery Life more than 14 

select `Brand Name`,`Average Battery Life (in days)`
from fitness
where `Average Battery Life (in days)`>14
group by `Brand Name`;

#4-Smart watches vs Fitness band

select sum(if(`Device Type`='FitnessBand',1,0)) as No_of_FitnessBand,sum(if(`Device Type`='Smartwatch',1,0)) as No_of_SmartWatches
from fitness;

#5-Top 5 companies based on no of products

select count(`Model Name`) as Total_Products,`Brand Name`
from fitness
group by `Brand Name`
order by Total_Products Desc
Limit 5;

#6-Are fitness trackers with highest ratings more expensive?

select `Brand Name`,`Selling price`,`Rating (Out of 5)`
from fitness
order by `Rating (Out of 5)` Desc;

#7-Does expensive fitness trackers products have a better battery life?


select `Brand Name`,`Selling price`,`Average Battery Life (in days)`
from fitness
order by  `Average Battery Life (in days)` Desc;

#8-Common color of fitness trackers over all comapny's products

select `color`,count(`Model Name`) as Total
from fitness
group by `color`
order by Total Desc
Limit 5;

#9-Most Common strap material for trackers

select `Strap Material`,count(`Model Name`) as Total
from fitness
group by `Strap Material`
order by Total Desc
Limit 5;

#10-Which display is more used in smartwatches and bands?

select count(`Model Name`) as Total_Products,`Device Type`,Display,rank() over(partition by `Device Type` order by count(`Model Name`) Desc ) as rnk
from fitness
group by Display;













