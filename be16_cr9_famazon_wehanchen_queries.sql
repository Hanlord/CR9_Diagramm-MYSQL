-- 1. query 
SELECT `customer`.`f_name`, `customer`.`l_name`, `order`.`order_date`, `product`.`product_price`
FROM `customer` 
	LEFT JOIN `order` ON `order`.`fk_customer_id` = `customer`.`id`
	, `product`;

-- 2.query
SELECT `office`.`fk_employer_id`, `employer`.`f_name`, `employer`.`l_name`
FROM `office` 
	LEFT JOIN `employer` ON `office`.`fk_employer_id` = `employer`.`id`;

-- 3.query
SELECT `office`.`fk_employer_id`, `employer`.`f_name`, `employer`.`salary`
FROM `office` 
	LEFT JOIN `employer` ON `office`.`fk_employer_id` = `employer`.`id`;

-- 4.query
SELECT `order`.`payment`, `customer`.`f_name`, `customer`.`l_name`
FROM `order` 
	LEFT JOIN `customer` ON `order`.`fk_customer_id` = `customer`.`id`;

-- 5.query
SELECT `order`.`order_date`, `product`.`product_type`, `customer`.`email`
FROM `order`
	, `product` 
	LEFT JOIN `customer` ON `order`.`fk_customer_id` = `customer`.`id`;

-- 6.query
SELECT `product`.`product_name`, `stock`.`quantity`, `product`.`product_price`
FROM `product` 
	LEFT JOIN `stock` ON `stock`.`fk_product_id` = `product`.`id`;

-- 7.query
SELECT `order`.`order_date`, `product`.`product_price`, `product`.`product_type`
FROM `order`
	, `product`
WHERE `product`.`product_price` > '800€';

-- 8.query
SELECT `employer`.`salary`, `employer`.`l_name`
FROM `employer`
WHERE `employer`.`salary` > '3800';