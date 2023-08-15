create database if not exists `order-directory`;
use `order-directory`;

-- suplier table schema 
CREATE TABLE IF NOT EXISTS supplier(
	SUPP_ID INT PRIMARY KEY AUTO_INCREMENT,
	SUPP_NAME VARCHAR(50) NOT NULL,
	SUPP_CITY VARCHAR(50),
	SUPP_PHONE VARCHAR(10) NOT NULL
);

-- customer schema
CREATE TABLE IF NOT EXISTS customer(
	CUS_ID INT PRIMARY KEY AUTO_INCREMENT,
	CUS_NAME VARCHAR(20) NOT NULL,
	CUS_PHONE VARCHAR(10) NOT NULL,
	CUS_CITY VARCHAR(30) NOT NULL,
	CUS_GENDER CHAR
);

-- category schema
CREATE TABLE IF NOT EXISTS category(
	CAT_ID INT PRIMARY KEY AUTO_INCREMENT,
	CAT_NAME VARCHAR(20) NOT NULL
);

-- product schema
CREATE TABLE IF NOT EXISTS product(
	PRO_ID INT PRIMARY KEY AUTO_INCREMENT,
	PRO_NAME VARCHAR(20) NOT NULL DEFAULT "Dummy",
	PRO_DESC VARCHAR(60),
	CAT_ID INT NOT NULL,
	FOREIGN KEY(CAT_ID) REFERENCES category(CAT_ID)
);

-- supplier pricing schema
CREATE TABLE IF NOT EXISTS supplier_pricing(
	PRICING_ID INT PRIMARY KEY AUTO_INCREMENT,
	PRO_ID INT NOT NULL,
	SUPP_ID INT NOT NULL,
	SUPP_PRICE INT DEFAULT 0,
	FOREIGN KEY(PRO_ID) REFERENCES product(PRO_ID),
	FOREIGN KEY(SUPP_ID) REFERENCES supplier(SUPP_ID)
);

-- order schema
CREATE TABLE IF NOT EXISTS `order` (
	ORD_ID INT PRIMARY KEY AUTO_INCREMENT,
	ORD_AMOUNT INT NOT NULL,
	ORD_DATE DATE,
	CUS_ID INT NOT NULL,
	PRICING_ID INT NOT NULL,
	FOREIGN KEY(CUS_ID) REFERENCES customer(CUS_ID),
	FOREIGN KEY(PRICING_ID) REFERENCES supplier_pricing(PRICING_ID)
);

-- updating auto increment value start value as 100
alter table `order` auto_increment = 101;

-- rating schema
CREATE TABLE IF NOT EXISTS rating (
	RAT_ID INT PRIMARY KEY AUTO_INCREMENT,
	ORD_ID INT NOT NULL,
	RAT_RATSTARS INT NOT NULL,
	FOREIGN KEY(ORD_ID) REFERENCES `order`(ORD_ID)
);

-- insert queries to insert rows into supplier table
insert into supplier(SUPP_NAME, SUPP_CITY, SUPP_PHONE) values('Rajesh Retails', 'Delhi', '1234567890');
insert into supplier(SUPP_NAME, SUPP_CITY, SUPP_PHONE) values('Appario Ltd.', 'Mumbai', '2589631470');
insert into supplier(SUPP_NAME, SUPP_CITY, SUPP_PHONE) values('Knome products', 'Banglore', '9785462315');
insert into supplier(SUPP_NAME, SUPP_CITY, SUPP_PHONE) values('Bansal Retails', 'Kochi', '8975463285');
insert into supplier(SUPP_NAME, SUPP_CITY, SUPP_PHONE) values('Mittal Ltd.', 'Lucknow', '7898456532');

-- insert queries to insert rows into customer table
insert into customer(CUS_NAME, CUS_PHONE, CUS_CITY, CUS_GENDER) values('AAKASH', '9999999999', 'DELHI', 'M');
insert into customer(CUS_NAME, CUS_PHONE, CUS_CITY, CUS_GENDER) values('AMAN', '9785463215', 'NOIDA', 'M');
insert into customer(CUS_NAME, CUS_PHONE, CUS_CITY, CUS_GENDER) values('NEHA', '9999999999', 'MUMBAI', 'F');
insert into customer(CUS_NAME, CUS_PHONE, CUS_CITY, CUS_GENDER) values('MEGHA', '9994562399', 'KOLKATA', 'F');
insert into customer(CUS_NAME, CUS_PHONE, CUS_CITY, CUS_GENDER) values('PULKIT', '7895999999', 'LUCKNOW', 'M');

-- insert queries to insert rows into category table
insert into category(CAT_NAME) values('BOOKS');
insert into category(CAT_NAME) values('GAMES');
insert into category(CAT_NAME) values('GROCERIES');
insert into category(CAT_NAME) values('ELECTRONICS');
insert into category(CAT_NAME) values('CLOTHES');

-- insert queries to insert rows into product table
insert into product(PRO_NAME, PRO_DESC, CAT_ID) values('GTA V', 'Windows 7 and above with i5 processor and 8GB RAM', 2);
insert into product(PRO_NAME, PRO_DESC, CAT_ID) values('TSHIRT', 'SIZE-L with Black, Blue and White variations', 5);
insert into product(PRO_NAME, PRO_DESC, CAT_ID) values('ROG LAPTOP', 'Windows 10 with 15inch screen, i7 processor, 1TB SSD', 4);
insert into product(PRO_NAME, PRO_DESC, CAT_ID) values('OATS', 'Highly Nutritious from Nestle', 3);
insert into product(PRO_NAME, PRO_DESC, CAT_ID) values('HARRY POTTER', 'Best Collection of all time by J.K Rowling', 1);
insert into product(PRO_NAME, PRO_DESC, CAT_ID) values('MILK', '1L Toned MIlk', 3);
insert into product(PRO_NAME, PRO_DESC, CAT_ID) values('Boat Earphones', '1.5Meter long Dolby Atmos', 4);
insert into product(PRO_NAME, PRO_DESC, CAT_ID) values('Jeans', 'Stretchable Denim Jeans with various sizes and color', 5);
insert into product(PRO_NAME, PRO_DESC, CAT_ID) values('Project IGI', 'compatible with windows 7 and above', 2);
insert into product(PRO_NAME, PRO_DESC, CAT_ID) values('Hoodie', 'Black GUCCI for 13 yrs and above', 5);
insert into product(PRO_NAME, PRO_DESC, CAT_ID) values('Rich Dad Poor Dad', 'Written by RObert Kiyosaki', 1);
insert into product(PRO_NAME, PRO_DESC, CAT_ID) values('Train Your Brain', 'By Shireen Stephen', 1);

-- insert queries to insert rows into supplier_pricing table
insert into supplier_pricing(PRO_ID, SUPP_ID, SUPP_PRICE) values(1, 2, 1500);
insert into supplier_pricing(PRO_ID, SUPP_ID, SUPP_PRICE) values(3, 5, 30000);
insert into supplier_pricing(PRO_ID, SUPP_ID, SUPP_PRICE) values(1, 2, 1500);
insert into supplier_pricing(PRO_ID, SUPP_ID, SUPP_PRICE) values(5, 1, 3000);
insert into supplier_pricing(PRO_ID, SUPP_ID, SUPP_PRICE) values(2, 3, 2500);
insert into supplier_pricing(PRO_ID, SUPP_ID, SUPP_PRICE) values(4, 1, 1000);
insert into supplier_pricing(PRO_ID, SUPP_ID, SUPP_PRICE) values(12 ,2, 780);
insert into supplier_pricing(PRO_ID, SUPP_ID, SUPP_PRICE) values(12, 4, 789);
insert into supplier_pricing(PRO_ID, SUPP_ID, SUPP_PRICE) values(3, 1, 31000);
insert into supplier_pricing(PRO_ID, SUPP_ID, SUPP_PRICE) values(1, 5, 1450);
insert into supplier_pricing(PRO_ID, SUPP_ID, SUPP_PRICE) values(4, 2, 999);
insert into supplier_pricing(PRO_ID, SUPP_ID, SUPP_PRICE) values(7, 3, 549);
insert into supplier_pricing(PRO_ID, SUPP_ID, SUPP_PRICE) values(7, 4, 529);
insert into supplier_pricing(PRO_ID, SUPP_ID, SUPP_PRICE) values(6, 2, 105);
insert into supplier_pricing(PRO_ID, SUPP_ID, SUPP_PRICE) values(6, 1, 99);
insert into supplier_pricing(PRO_ID, SUPP_ID, SUPP_PRICE) values(2, 5, 2999);
insert into supplier_pricing(PRO_ID, SUPP_ID, SUPP_PRICE) values(5, 2, 2999);

-- insert queries to insert rows into order table
insert into `order`(ORD_AMOUNT, ORD_DATE, CUS_ID, PRICING_ID) values(1500, '2021-10-06', 2, 1);
insert into `order`(ORD_AMOUNT, ORD_DATE, CUS_ID, PRICING_ID) values(1000, '2021-10-12', 3, 5);
insert into `order`(ORD_AMOUNT, ORD_DATE, CUS_ID, PRICING_ID) values(30000, '2021-09-16', 5, 2);
insert into `order`(ORD_AMOUNT, ORD_DATE, CUS_ID, PRICING_ID) values(1500, '2021-10-05', 1, 1);
insert into `order`(ORD_AMOUNT, ORD_DATE, CUS_ID, PRICING_ID) values(3000, '2021-08-16', 4, 3);
insert into `order`(ORD_AMOUNT, ORD_DATE, CUS_ID, PRICING_ID) values(1450, '2021-08-18', 1, 9);
insert into `order`(ORD_AMOUNT, ORD_DATE, CUS_ID, PRICING_ID) values(789, '2021-09-01', 3, 7);
insert into `order`(ORD_AMOUNT, ORD_DATE, CUS_ID, PRICING_ID) values(780, '2021-09-07', 5, 6);
insert into `order`(ORD_AMOUNT, ORD_DATE, CUS_ID, PRICING_ID) values(3000, '2021-09-10', 5, 3);
insert into `order`(ORD_AMOUNT, ORD_DATE, CUS_ID, PRICING_ID) values(2500, '2021-09-10', 2, 4);
insert into `order`(ORD_AMOUNT, ORD_DATE, CUS_ID, PRICING_ID) values(1000, '2021-09-15', 4, 5);
insert into `order`(ORD_AMOUNT, ORD_DATE, CUS_ID, PRICING_ID) values(789, '2021-09-16', 4, 7);
insert into `order`(ORD_AMOUNT, ORD_DATE, CUS_ID, PRICING_ID) values(31000, '2021-09-16', 1, 8);
insert into `order`(ORD_AMOUNT, ORD_DATE, CUS_ID, PRICING_ID) values(1000, '2021-09-16', 3, 5);
insert into `order`(ORD_AMOUNT, ORD_DATE, CUS_ID, PRICING_ID) values(3000, '2021-09-16', 5, 3);
insert into `order`(ORD_AMOUNT, ORD_DATE, CUS_ID, PRICING_ID) values(99, '2021-09-17', 2, 14);

-- insert queries to insert rows into rating table
insert into rating(ORD_ID, RAT_RATSTARS) values(101, 4);
insert into rating(ORD_ID, RAT_RATSTARS) values(102, 3);
insert into rating(ORD_ID, RAT_RATSTARS) values(103, 1);
insert into rating(ORD_ID, RAT_RATSTARS) values(104, 2);
insert into rating(ORD_ID, RAT_RATSTARS) values(105, 4);
insert into rating(ORD_ID, RAT_RATSTARS) values(106, 3);
insert into rating(ORD_ID, RAT_RATSTARS) values(107, 4);
insert into rating(ORD_ID, RAT_RATSTARS) values(108, 4);
insert into rating(ORD_ID, RAT_RATSTARS) values(109, 3);
insert into rating(ORD_ID, RAT_RATSTARS) values(110, 5);
insert into rating(ORD_ID, RAT_RATSTARS) values(111, 3);
insert into rating(ORD_ID, RAT_RATSTARS) values(112, 4);
insert into rating(ORD_ID, RAT_RATSTARS) values(113, 2);
insert into rating(ORD_ID, RAT_RATSTARS) values(114, 1);
insert into rating(ORD_ID, RAT_RATSTARS) values(115, 1);
insert into rating(ORD_ID, RAT_RATSTARS) values(116, 0);

-- Q4: Display the total number of customers based on gender who have placed 
-- individual orders of worth at least Rs.3000

select CUS_GENDER, COUNT(*) as TOTAL_CUSTOMERS from customer where CUS_ID in (
    select distinct CUS_ID from `order` where ORD_AMOUNT >= 3000
) group by CUS_GENDER;

-- Q5: Display all the orders along with product name ordered by a customer having Customer_Id=2

select product.PRO_NAME as 'PRODUCT NAME', `order`.ORD_ID as 'ORDER ID', 
	`order`.ORD_AMOUNT as 'ORDER AMOUNT', `order`.ORD_DATE as 'ORDER DATE'
	from `order`, supplier_pricing sp, product
	where CUS_ID = 2 
	and `order`.PRICING_ID = sp.PRICING_ID 
	and sp.PRO_ID = product.PRO_ID;

-- Q6: Display the Supplier details who can supply more than one product.

select supplier.* from supplier_pricing sp inner join supplier on supplier.SUPP_id = sp.SUPP_ID
	group by SUPP_ID having count(*) > 1;
    
-- Q7: Find the least expensive product from each category and 
-- print the table with category id, name, product name and price of the product
    
select category.cat_id as 'CATEGORY ID', category.cat_name as 'CATEGORY NAME', 
	min(category_min.min_price) as 'MIN PRICE' 
    from category inner join(
		select product.cat_id, product.pro_name, product_min.* from product inner join(
			select pro_id, min(supp_price) as Min_Price from supplier_pricing group by pro_id
		) as product_min where product_min.pro_id = product.pro_id
	) as category_min where category_min.cat_id = category.cat_id group by category_min.cat_id;

-- Q8: Display the Id and Name of the Product ordered after “2021-10-05”

select p.PRO_ID as 'PRODUCT ID', p.PRO_NAME as 'PRODUCT NAME', o.ORD_DATE as 'ORDER DATE'
	from `order` o inner join supplier_pricing sp 
	on sp.PRICING_ID = o.PRICING_ID inner join product p on sp.PRO_ID = p.PRO_ID
	where o.ORD_DATE > "2021-10-05";

-- Q9: Display customer name and gender whose names start or end with character 'A'.

select CUS_NAME as 'CUSTOMER NAME', CUS_GENDER as 'GENDER' 
	from customer where CUS_NAME LIKE "A%" OR CUS_NAME LIKE "%A";
    
-- Q10: Create a stored procedure to display supplier id, name, 
-- Rating(Average rating of all the products sold by every customer) and Type_of_Service. 
-- For Type_of_Service, If rating =5, print “Excellent Service”,
-- If rating >4 print “Good Service”, 
-- If rating >2 print “Average Service” 
-- else print “Poor Service”. 
-- Note that there should be one rating per supplier.

create definer='root'@'localhost' procedure rating_proc()
begin
	select report.supp_id, report.supp_name, report.Average,
	case
		when report.Average = 5 then 'Excellent Service'
    	when report.Average > 4 then 'Good Service'
    	when report.Average > 2 then 'Average Service'
    	else 'Poor Service'
	end as Type_of_Service from(
		select final.supp_id, supplier.supp_name, final.Average from(
			select test2.supp_id, sum(test2.rat_ratstars)/count(test2.rat_ratstars) as Average from(
				select supplier_pricing.supp_id, test.ORD_ID, test.RAT_RATSTARS from supplier_pricing inner join(
					select `order`.pricing_id, rating.ORD_ID, rating.RAT_RATSTARS 
						from `order` inner join rating on rating.`ord_id` = `order`.ord_id
                ) as test on test.pricing_id = supplier_pricing.pricing_id
            ) as test2 group by test2.supp_id
        ) as final inner join supplier where final.supp_id = supplier.supp_id
    ) as report;
end
