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
SELECT `customer`.`l_name`, `order`.`order_date`, `many_product`.`fk_product_id`, `product`.`product_price`
FROM `customer` 
	LEFT JOIN `order` ON `order`.`fk_customer_id` = `customer`.`id`
	, `many_product` 
	LEFT JOIN `product` ON `many_product`.`fk_product_id` = `product`.`id`;

-- 4.query
SELECT `customer`.`l_name`, `order`.`payment`, `many_product`.`fk_company_id`, `company`.`name`, `shipping`.`fk_many_product_id`
FROM `customer` 
	LEFT JOIN `order` ON `order`.`fk_customer_id` = `customer`.`id`
	, `many_product` 
	LEFT JOIN `company` ON `many_product`.`fk_company_id` = `company`.`id` 
	LEFT JOIN `shipping` ON `shipping`.`fk_many_product_id` = `many_product`.`id`;

-- 5.query
SELECT `customer`.`l_name`, `product`.`product_price`, `many_product`.`fk_product_id`, `e-commerce`.`fk_order_id`, `order`.`payment`, `shipping`.`fk_many_product_id`, `product`.`product_type`
FROM `customer`
	, `product` 
	LEFT JOIN `many_product` ON `many_product`.`fk_product_id` = `product`.`id` 
	LEFT JOIN `e-commerce` ON `e-commerce`.`fk_many_product_id` = `many_product`.`id` 
	LEFT JOIN `order` ON `e-commerce`.`fk_order_id` = `order`.`id` 
	LEFT JOIN `shipping` ON `shipping`.`fk_many_product_id` = `many_product`.`id`;

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