-- most selling products for offline_transaction_fact
select  product_name , sum(quantity) as total_quantity
from offline_transaction_fact f , product_dim d
where f.product_key = d.product_key 
group by  product_name
order by total_quantity desc 
limit 5;

-- most selling products for online_transaction_fact
select  product_name , sum(quantity) as total_quantity
from online_transaction_fact f , product_dim d
where f.product_key = d.product_key 
group by  product_name
order by total_quantity desc 
limit 5;

-- most redeemed offers for offline_transaction_fact
select offer_redeemed , count(*)as redeemed_num
from offline_transaction_fact 
where offer_redeemed != 'NA'
group by offer_redeemed
order by redeemed_num desc ;

-- most redeemed offers for online_transaction_fact
select offer_redeemed , count(*)as redeemed_num
from online_transaction_fact 
where offer_redeemed != 'NA'
group by offer_redeemed
order by redeemed_num desc ;

-- most redeemed offers per product for offline_transaction_fact
select product_name,offer_redeemed , count(*)as redeemed_num
from offline_transaction_fact f, product_dim d
where f.product_key = d.product_key
and offer_redeemed != 'NA'
group by product_name,offer_redeemed
order by redeemed_num desc 
limit 10;

-- most redeemed offers per product for online_transaction_fact
select product_name,offer_redeemed , count(*)as redeemed_num
from online_transaction_fact f, product_dim d
where f.product_key = d.product_key
and offer_redeemed != 'NA'
group by product_name,offer_redeemed
order by redeemed_num desc 
limit 10;

--  lowest cities in online sales
select shipping_city , sum(final_price) as total_amount
from online_transaction_fact
group by shipping_city
order by total_amount 
limit 10 ;

-- B2B  daily dump 
select agent_name , product_name , sum(quantity) total_sold_units
from offline_transaction_fact f , agent_dim a , product_dim p
where f.agent_key = a.agent_key 
and f.product_key = p.product_key
group by agent_name , product_name ;
