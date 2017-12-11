CREATE TABLE Homepage (
  welcome_text TEXT
);

CREATE TABLE Department (
  id int PRIMARY KEY NOT NULL AUTO_INCREMENT,
  title varchar(255) NOT NULL,
  description TEXT,
  short_description varchar(255),
  parent_id int,
  FOREIGN KEY (parent_id) REFERENCES Department(id)
);

CREATE TABLE Product (
  product_id int PRIMARY KEY NOT NULL AUTO_INCREMENT,
  title varchar(255) NOT NULL,
  description TEXT,
  short_description varchar(255),
  featured tinyint(1) NOT NULL,
  available tinyint(1) NOT NULL,
  stock_quantity int NOT NULL,
  tax DECIMAL(10, 2) NOT NULL DEFAULT '0.33',
  price_without_tax DECIMAL(10, 2) NOT NULL,
  discount DECIMAL(10, 2) NOT NULL,
  department_id int NOT NULL,
  FOREIGN KEY (department_id) REFERENCES Department(id)
);

CREATE TABLE Orders (
  id int PRIMARY KEY NOT NULL AUTO_INCREMENT,
  tracking_number int NOT NULL,
  order_date datetime NOT NULL,
  date_of_last_change datetime NOT NULL,
  order_status varchar(255) DEFAULT 'Order Recieved',
  payment_reference varchar(255),
  user_id int NOT NULL,
  FOREIGN KEY (user_id) REFERENCES User(id)
);

CREATE TABLE Orderdetails(
  price DECIMAL(10,2) NOT NULL,
  quantity int NOT NULL,
  order_id int NOT NULL,
  product_id int NOT NULL,
  FOREIGN KEY (order_id) REFERENCES Orders(id),
  FOREIGN KEY (product_id) REFERENCES Product(product_id)
);

CREATE TABLE User(
  id int PRIMARY KEY NOT NULL AUTO_INCREMENT,
  firstname varchar(255) NOT NULL,
  lastname varchar(255) NOT NULL,
  password varchar(255) NOT NULL,
  email varchar(255) NOT NULL,
  street varchar(255) NOT NULL,
  housenumber int,
  city varchar(255),
  zip int NOT NULL,
  country varchar(255) NOT NULL,
  phone_number int NOT NULL,
  newsletter boolean NOT NULL
);

CREATE TABLE Review(
  score int NOT NULL CHECK(score BETWEEN 1 AND 5),
  user_review varchar(255) NOT NULL,
  user_id int NOT NULL,
  product_id int NOT NULL,
  PRIMARY KEY(user_id, product_id),
  FOREIGN KEY (user_id) REFERENCES User(id),
  FOREIGN KEY (product_id) REFERENCES Product(product_id)
);

CREATE TABLE Related(
  keyword_id int NOT NULL,
  product_id int NOT NULL,
  PRIMARY KEY(keyword_id, product_id),
  FOREIGN KEY(keyword_id) REFERENCES Keyword(keyword_id),
  FOREIGN KEY(product_id) REFERENCES Product(product_id)
);


CREATE TABLE Keyword(
  keyword_id int NOT NULL PRIMARY KEY,
  keyword varchar(255) NOT NULL
);
