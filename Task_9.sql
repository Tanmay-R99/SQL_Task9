-- TASK 

select * from sales
select sales / quantity from sales
	

create or replace function Getprofit(productId varchar)
RETURNS double precision as $$
declare 
	sales_sum double precision ;
	profit_sum double precision;
	profitPer double precision; 
	
BEGIN
	select sum(sales) as sales_sum , sum(profit) as profit_sum into sales_sum , profit_sum 
	from sales where  product_id = productId;

	profitPer := (profit_sum / sales_sum) * 100 ;

return profitPer;
END;
$$ LANGUAGE plpgsql;


select Getprofit('OFF-LA-10000240')