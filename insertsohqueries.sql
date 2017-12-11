insert into department (id, title, description, short_description, parent_id)
values(1, "Electronics", "Lorem Ipsum", "Lorem");

insert into department (id, title, description, short_description, parent_id)
values(2, "Food", "All you can eat", "eat");

insert into department (id, title, description, short_description, parent_id)
values(3, "Computer", "Gaming", "Game", 1);

insert into department (id, title, description, short_description, parent_id)
values(4, "Phones", "Used to make phone calls", "Calls", 1);

insert into department (id, title, description, short_description, parent_id)
values(5, "Tablets", "Intermediate between computers and phones", "Give it to your child", 1);

insert into department (id, title, description, short_description, parent_id)
values(6, "Candy", "Sugar for your sweet tooth", "Sugar", 2);

insert into department (id, title, description, short_description, parent_id)
values(7, "Meat", "grass-fed beef and tender chicken", "protein", 2);

insert into department (id, title, description, short_description, parent_id)
values(8, "Pasta", "the finest pasta directly from Italy", "carbs", 2);

insert into product (Product_id, Short_description, Description, Featured, Title, Available, Stock_quantity, Price_without_tax, price_with_tax, Discount, department_id)
values(1, "Fast cmputer", "Fast computer from Apple", 0, "MacBook Pro", 1, 10, 11000.99, 13000.59, 1, 3);

insert into product (Product_id, Short_description, Description, Featured, Title, Available, Stock_quantity, Price_without_tax, price_with_tax, Discount, department_id)
values(2, "Slow computer", "Slow computer from lenovo", 1, "Lenovo 1323", 1, 10, 4000.99, 5000.99, 0.7, 3);

insert into product (Product_id, Short_description, Description, Featured, Title, Available, Stock_quantity, Price_without_tax, price_with_tax, Discount, department_id)
values(3, "smart phone", "Apples new smart phone Iphone X", 0, "Iphone X", 1, 100, 8000.99, 10000, 1, 4);

insert into product (Product_id, Short_description, Description, Featured, Title, Available, Stock_quantity, Price_without_tax, price_with_tax, Discount, department_id)
values(4, "Smart tablet", "Apples new tablet!", 0, "Ipad 7", 0, 0,4000, 4999.99, 1, 5);

insert into product (Product_id, Short_description, Description, Featured, Title, Available, Stock_quantity, Price_without_tax, price_with_tax, Discount, department_id)
values(5, "Sweet and sour", "Jolly ranchers in all flavours", 1, "Jolly Ranchers", 1, 1000, 8, 10, 0.9, 6);

insert into product (Product_id, Short_description, Description, Featured, Title, Available, Stock_quantity, Price_without_tax, price_with_tax, Discount, department_id)
values(6, "Great for cristmas", "strawberry flavoured marshmellows", 1, "Santa foam", 1, 1000, 8, 10, 0.9, 6);

insert into product (Product_id, Short_description, Description, Featured, Title, Available, Stock_quantity, Price_without_tax, price_with_tax, Discount, department_id)
values(7, "grade A Beef", "Made from cow", 0, "Sirloin", 0, 0, 60, 100, 1, 7);

insert into product (Product_id, Short_description, Description, Featured, Title, Available, Stock_quantity, Price_without_tax, price_with_tax, Discount, department_id)
values(8, "Grade A Chicken", "'swedish chicken", 0, "Chicken breast", 1, 50, 40, 60.99, 1, 7);

insert into product (Product_id, Short_description, Description, Featured, Title, Available, Stock_quantity, Price_without_tax, price_with_tax, Discount, department_id)
values(9, "Grade A Pasta", "Made in Italy", 0, "fettuccine", 1, 100, 15, 25, 1, 8);

insert into product (Product_id, Short_description, Description, Featured, Title, Available, Stock_quantity, Price_without_tax, price_with_tax, Discount, department_id)
values(10, "Grade B Pasta", "Made in Italy", 0, "Pappardelle", 1, 124, 13, 20.99, 1, 8);

insert into user (ID, newsletter, password, phone_number, email, address, name)
values(1, 0, "ABC123", 0701324545, "baba@live.se", "Grändvägen 123", "Adam Adamsson");

insert into user (ID, newsletter, password, phone_number, email, address, name)
values(2, 1, "HEJHEH123", 0708493022, "Fredrik_innebandy_fotboll@live.se", "Vägens Gränd 321", "Greta Hejsson");

insert into review (score, user_review, user_ID, product_id)
values(5, "Best Pasta very good",1, 9);

insert into review (score, user_review, user_ID, product_id)
values(1, "Meh, I dont like pasta",2, 9);

INSERT INTO `fall17_project_it21`.Orders (`id`, `tracking_number`, `date_of_last_change`, `order_date`, `order_status`, `payment_reference`, `user_id`)
VALUES ('1', '123', '20171204', '20171204', 'Pending', '12345', '1');

insert into orderdetails(price, quantity, order_id, product_id)
values(25, 100, 1, 9);

INSERT INTO fall17_project_it21.Orders (id, tracking_number, date_of_last_change, order_date, order_status, payment_reference, user_id)
VALUES ('2', '321', '2017-12-03', '2017-12-02', 'Pending', 'VISA', '1');

INSERT INTO orderdetails(price, quantity, order_id, product_id) VALUES (60.99, 2, 2, 8);

INSERT INTO fall17_project_it21.Orders (id, tracking_number, date_of_last_change, order_date, order_status, payment_reference, user_id)
VALUES ('3', '524', '2017-12-02', '2017-12-01', 'Pending', 'Mastercard', '2');

INSERT INTO orderdetails(price, quantity, order_id, product_id) VALUES (10000, 1, 3, 3);

INSERT INTO fall17_project_it21.Orders (id, tracking_number, date_of_last_change, order_date, order_status, payment_reference, user_id)
VALUES ('4', '5444', '2017-12-02', '2017-12-01', 'Pending', 'Mastercard', '2');

INSERT INTO orderdetails(price, quantity, order_id, product_id) VALUES (10000, 2, 4, 3);


/*      QUERRIES

• Welcome text for the homepage*/
select Welcome_text from Homepage;

/*• List of the top level departments with fields needed for the homepage*/
select title, short_description from Department where id = 1 OR id = 2;

/*• List of the featured products with fields needed for the homepage*/
select title, stock_quantity, discount, (price_without_tax*tax*discount) AS CurrentRetailprice from Product where featured = 1;

/*• Given a product, list all keyword-related products*/
select distinct Product.title, Product.product_id, a.keyword_id
from Product
join Related a on Product.product_id = a.product_id
where a.keyword_id in
(select keyword_id from Related b
where b.product_id = 2)
AND NOT a.product_id = 2
group by Product.title;

/*• Given an department, list of all its products (title, short description, current retail price) with their
average rating*/
SELECT distinct Product.title, Product.short_description, (Product.tax*Product.price_without_tax*Product.discount)
AS CurrentRetailprice, avg(Review.score)
from Product
left join Review on Product.product_id= Review.product_id
where department_id = 8
group by Product.title;

/*• List of all products on sale sorted by the discount percentage (starting with the biggest discount)*/
SELECT *
FROM Product
WHERE discount > 0.0 AND discount < 1
ORDER BY discount ASC;

/*• List of all new orders sorted by the order date (id, order date, customer’s name and the city, and the total price)*/
SELECT Orders.id, Orders.order_date, User.firstname, User.lastname, User.city, SUM(Orderdetails.price*Orderdetails.quantity)
AS Totalprice
FROM Orders, User, Orderdetails
WHERE Orderdetails.order_id = Orders.id AND Orders.user_id = User.id AND Orders.order_status = 'Order Recieved'
ORDER BY order_date DESC;

/*• 10 best-selling products (in last 30 days)*/
SELECT Product.title, Orders.order_date, SUM(Orderdetails.quantity) AS MostSold
FROM Orders, Orderdetails, Product
WHERE DATE_ADD(Orders.order_date, INTERVAL 30 DAY) >= CURDATE()
AND Orderdetails.order_id = Orders.id AND Orderdetails.product_id = Product.product_id
GROUP BY Product.title
ORDER BY SUM(quantity) DESC LIMIT 10;
