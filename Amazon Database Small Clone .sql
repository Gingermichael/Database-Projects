CREATE TABLE products
(
 product_id number(10) not null,
 product_name varchar2(100) not null,
 product_price number(8,2),
 prime_eligiblity varchar2(50), 
 lightning_deal_price number(8,2),
 amazons_choice_eligibility varchar2(50),
 CONSTRAINT products_pk PRIMARY KEY (product_id)
);

CREATE SEQUENCE product_id_seq
START WITH 1
INCREMENT BY 1
MINVALUE 1
NOMAXVALUE
ORDER;

INSERT INTO products
values (product_id_seq.NEXTVAL, 'Sony 32in TV', 253.54, 'eligible', 186.75, 'not eligible');

INSERT INTO products
values (product_id_seq.NEXTVAL, 'Nick Cannon Full Size Cutout', 69.99, 'not eligible', null, 'not eligible');

INSERT INTO products
values (product_id_seq.NEXTVAL, 'Kraft Questionable Cheese', 8.65, 'eligible', null, 'not eligible');

INSERT INTO products
values (product_id_seq.NEXTVAL, 'A Stolen Laptop', 499.99, 'not eligible', null, 'not eligible');

INSERT INTO products
values (product_id_seq.NEXTVAL, 'A Very Angry Badger', 305.50, 'not eligible', null, 'not eligible');

INSERT INTO products
values (product_id_seq.NEXTVAL, 'Black Lives Matter Face Mask', 11.98, 'eligible', null, 'eligible');

INSERT INTO products
values (product_id_seq.NEXTVAL, 'Becoming, By Michelle Obama', 15.99, 'eligible', 12.99, 'eligible');

INSERT INTO products
values (product_id_seq.NEXTVAL, 'A Potato Cannon', 84.99, 'not eligible', null, 'eligible');

INSERT INTO products
values (product_id_seq.NEXTVAL, 'An Open Snickers Bar', 0.38, 'not eligible', null, 'not eligible');

CREATE TABLE customers 
(
customer_id number(16) NOT NULL,
first_name varchar2(25) NOT NULL,
last_name varchar2(50) NOT NULL,
customer_adress varchar2(50) NOT NULL,
customer_adress_state varchar2(2),
customer_adress_zip_code varchar2(11),
customer_country_code varchar(3),
customer_adress_2 varchar2(50),
customer_adress_2_state varchar2(2),
customer_adress_2_zip_code varchar2(11),
customer_country_code_2 varchar2(3),
customer_card number(16),
customer_card_pin number(4),
CONSTRAINT customers_pk PRIMARY KEY (customer_id)
)
;

CREATE SEQUENCE customer_id_seq
START WITH 1
INCREMENT BY 1
MINVALUE 1
NOMAXVALUE
ORDER;


INSERT INTO customers 
values (customer_id_seq.NEXTVAL, 'Donald', 'Trump', '1600 Pennsylvania Avenue', 'DC', '20500', null, '401 N Wabash Ave', 'IL', '60611', null, 7901562382340002, 2657); 

INSERT INTO customers
values (customer_id_seq.NEXTVAL, 'Scooter', 'White', '420 Single Boulevard', 'PA', '19019', null, null, null, null, null, 4782599299684212, 5683);

INSERT INTO customers
values (customer_id_seq.NEXTVAL, 'Lebron', 'James', '1111 S Figueroa Street', 'CA', '90015', null, null, null, null, null, 8012673493451113, 3768);

INSERT INTO customers 
values (customer_id_seq.NEXTVAL, 'Puff', 'Daddy', '1800 Harlem Avenue', 'NY', '10037', null, '100 Broadway Avenue', 'NY', '00023', null, 4623754382838394, 7538); 

INSERT INTO customers
values (customer_id_seq.NEXTVAL, 'Ilhan', 'Omar', '1100 Minnesota Street', 'MN', '56710', null, null, null, null, null, 2747938209385384, 0239);

INSERT INTO customers
values (customer_id_seq.NEXTVAL, 'Emma', 'Watson', '4 Privet Drive', null, 'CH61 1DE', '001', null, null, null, null, 9304953934995934, 1873);

INSERT INTO customers 
values (customer_id_seq.NEXTVAL, 'Juan', 'Cortez', '4283 Jefferson Bl', 'AR', '85111', null, null, null, null, null, 1128487273847340, 2298); 

INSERT INTO customers
values (customer_id_seq.NEXTVAL, 'Samantha', 'Jones', '19 Lakeview Drive', 'FL', '32004', null, null, null, null, null, 7473283473883221, 9923);

INSERT INTO customers
values (customer_id_seq.NEXTVAL, 'Rosa', 'Parks', '1203 Legend Lane', 'AL', '36043', null, null, null, null, null, 6112742627377884, 0291);


create table AmazonSales
(
Sales_ID number(10) NOT NULL,
product_id number(10) NOT NULL,
product_name varchar2(50) NOT NULL,
product_quantity number(6) NOT NULL,
customer_id number(16) NOT NULL,
first_name varchar2(25) NOT NULL,
last_name varchar2(50) NOT NULL,
Date_of_Sale timestamp NOT NULL,
customer_card number(16) NOT NULL,
customer_card_pin number(4) NOT NULL,
payment_amount number(8,2) NOT NULL,
billing_zip_code varchar2(11) NOT NULL,
shipping_address varchar(50) NOT NULL,
shipping_adress_state varchar2(2),
shipping_adress_zip_code varchar2(50) NOT NULL,
customer_country_code number(3),
CONSTRAINT AmazonSales_pk PRIMARY KEY (Sales_ID),
CONSTRAINT fk_products FOREIGN KEY (product_id) REFERENCES products(product_id),
CONSTRAINT fk_customers FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

CREATE SEQUENCE sales_id_seq
START WITH 1
INCREMENT BY 1
MINVALUE 1
NOMAXVALUE
ORDER;


INSERT INTO AmazonSales 
values (sales_id_seq.NEXTVAL, 3, 'Kraft Questionable Cheese', 20, 1, 'Donald', 'Trump', timestamp '2020-11-03 19:01:25', 7901562382340002, 2657, 173.00, '20500', '1600 Pennsylvania Avenue', 'DC', '20500', null); 

INSERT INTO AmazonSales
values (sales_id_seq.NEXTVAL, 1, 'Sony 32in TV', 2, 2, 'Scooter', 'White', timestamp '2020-04-02 15:45:34', 4782599299684212, 5683, 507.08, '19019', '420 Single Boulevard', 'PA', '19019', null);

INSERT INTO AmazonSales
values (sales_id_seq.NEXTVAL, 2, 'Nick Cannon Full Size Cutout', 3, 3, 'Lebron', 'James', timestamp '2020-04-03 12:51:29', 8012673493451113, 3768, 209.97, '90015', '1111 S Figueroa Street', 'CA', '90015', null);

INSERT INTO AmazonSales 
values (sales_id_seq.NEXTVAL, 9, 'An Open Snickers Bar', 15, 8, 'Samantha', 'Jones', timestamp '2020-08-06 22:21:45', 7473283473883221, 9923, 5.70, '32004', '19 Lakeview Drive', 'FL', '32004', null); 

INSERT INTO AmazonSales
values (sales_id_seq.NEXTVAL, 7, 'Becoming, By Michelle Obama', 1, 5, 'Ilhan', 'Omar', timestamp '2020-06-07 05:11:12', 2747938209385384, 0239, 15.99, '56710', '1100 Minnesota Street', 'MN', '56710', null);

INSERT INTO AmazonSales
values (sales_id_seq.NEXTVAL, 6, 'Black Lives Matter Face Mask', 100, 9, 'Rosa', 'Parks', timestamp '2020-09-23 09:44:01', 6112742627377884, 0291, 1198.00, '36043', '1203 Legend Lane', 'AL', '36043', null);

INSERT INTO AmazonSales 
values (sales_id_seq.NEXTVAL, 5, 'A Very Angry Badger', 1, 7, 'Juan', 'Cortez', timestamp '2020-02-09 05:49:04', 1128487273847340, 2298, 305.50, '85111', '4283 Jefferson Bl', 'AR', '85111', null); 

INSERT INTO AmazonSales
values (sales_id_seq.NEXTVAL, 7, 'A Potato Cannon', 2, 5, 'Ilhan', 'Omar', timestamp '2020-05-17 15:12:12', 2747938209385384, 0239, 170.00, '56710', '1100 Minnesota Street', 'MN', '56710', null);

INSERT INTO AmazonSales
values (sales_id_seq.NEXTVAL, 6, 'Black Lives Matter Face Mask', 50, 1, 'Donald', 'Trump', timestamp '2020-06-21 13:44:37', 7901562382340002, 2657, 599.00, '60611', '401 N Wabash Ave', 'IL', '60611', null);

INSERT INTO AmazonSales 
values (sales_id_seq.NEXTVAL, 4, 'A Stolen Laptop', 1, 4, 'Puff', 'Daddy', timestamp '2020-01-08 02:38:10', 4623754382838394, 7538, 499.99, '10037', '1800 Harlem Avenue', 'NY', '10037', null); 

INSERT INTO AmazonSales
values (sales_id_seq.NEXTVAL, 2, 'Nick Cannon Full Size Cutout', 1, 6, 'Emma', 'Watson', timestamp '2020-08-17 09:56:32', 9304953934995934, 1873, 69.99, 'CH61 1DE', '4 Privet Drive', null, 'CH61 1DE', '001');

COMMIT;