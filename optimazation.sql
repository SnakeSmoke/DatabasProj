
CREATE TABLE Department (
  id int PRIMARY KEY NOT NULL,
  title varchar(255) NOT NULL,
  description TEXT,
  short_description varchar(255),
  parent_id int,
  FOREIGN KEY (parent_id) REFERENCES (id)
);

INSERT INTO Department (id, title, description, short_description, parent_id)
VALUES(2, "Food", "All you can eat", "eat");

CREATE TABLE Department (
  id int PRIMARY KEY NOT NULL AUTO_INCREMENT,
  title varchar(255) NOT NULL,
  description TEXT,
  short_description varchar(255),
  parent_id int,
  FOREIGN KEY (parent_id) REFERENCES (id)
);

INSERT INTO Department (id, title, description, short_description, parent_id)
VALUES("Food", "All you can eat", "eat");



order_status varchar(255) DEFAULT 'Order Recieved',
