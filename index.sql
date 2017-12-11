
/*Indexing OrderDate will make searching by date much quicker than before. This is likely to
be used by the company, therefore improving the query efficiency significantly */
CREATE INDEX OrdersDate ON `orders`(order_date)

/*The amount of stored orders might heavily increase over time. The TrackingNumber of the
orders was indexed to deduce the effect of this.*/
CREATE INDEX TrackingNumber ON `orders`(tracking_number)

/*The PaymentReference of the Orders table was indexed due to the same reasoning above(Index
4).*/
CREATE INDEX PaymentReference ON `orders`(payment_reference)


/*The Title of the Product table was indexed due to the query of a product will be issued frequently*/
CREATE INDEX Title on Product(title)

/*Indexing by name seemed reasonable. A company wants to quickly find a
customer by name and it’s history with the company. */
CREATE INDEX Name on User(firstname, lastname)

/*Indexing a product and its price is often done due to people
always searching for the best prices on products. */
CREATE INDEX PriceOnProduct ON Product(title ,price_with_tax)
