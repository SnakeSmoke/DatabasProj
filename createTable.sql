create table review(
score int not null check (score between 1 and 5),
user_review varchar(255) not null,

user_ID int not null,
product_ID int not null,

foreign key (user_ID)
references user(ID),

foreign key (product_ID)
references product(Product_id)

);

create table keyword(
keyword_ID int not null,
keyword varchar(255) not null,

primary key(keyword_ID, keyword)

);

create table user (
    ID int not null primary key,
    newsletter boolean not null,
    password varchar(255) not null,
    phone_number int not null,
    email varchar(255) not null,
    address varchar(255) not null,
    name varchar(255) not null
    
    );

alter table keyword add column product_id int not null,
add foreign key keyword(product_id) references product(Product_id)

use fall17_project_it21;
alter table review modify user_ID char(255) not null;
alter table review modify user_ID char(255) not null;

alter table department
add column parent_id int not null,
add foreign key parent_id references id;