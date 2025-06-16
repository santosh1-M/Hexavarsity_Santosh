use bookingticket;
create table screen(screen_id Int AUTO_INCREMENT PRIMARY KEY,
name VARCHAR(50) NOT NULL,class_type VARCHAR(10) NOT NULL,capacity INT NOT NULL);
INSERT INTO screen (name, class_type, capacity) VALUES
('A', 'Gold', 150),
('B', 'Silver', 120),
('C', 'Iron', 100),
('D', 'Gold', 180),
('E', 'Silver', 130),
('F', 'Iron', 90),
('G', 'Gold', 200),
('H', 'Silver', 140),
('I', 'Iron', 110),
('J', 'Gold', 160);
select*from screen;
CREATE TABLE Seat (
    seat_id INT AUTO_INCREMENT PRIMARY KEY,
    seat_number VARCHAR(10) NOT NULL,
    screen_id INT NOT NULL,
    FOREIGN KEY (screen_id) REFERENCES Screen(screen_id)
);
INSERT INTO Seat (seat_number, screen_id) VALUES
('C1', 3),
('C2', 3),
('C3', 3),
('C4', 3),
('C5', 3);
INSERT INTO Seat (seat_number, screen_id) VALUES
('B1', 2),
('B2', 2),
('B3', 2),
('B4', 2),
('B5', 2);
select*from seat;
delete  from seat where screen_id=3;
select*from seat;
INSERT INTO Seat (seat_number, screen_id) VALUES
('C1', 3),
('C2', 3),
('C3', 3),
('C4', 3),
('C5', 3);
select*from seat;
create table simple(roll_id INT PRIMARY KEY,name varchar(50));
insert into simple Values(1,'sandy'),(2,'mandy');
select*from simple;
truncate table simple;
select*from simple;
drop table simple;
CREATE TABLE Movie (
    movie_id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    genre VARCHAR(50) NOT NULL,
    rating DECIMAL(3,1) NOT NULL,
    status VARCHAR(20) NOT NULL
);
INSERT INTO Movie (title, genre, rating, status) VALUES
('Inception', 'Sci-Fi', 8.8, 'Now Showing'),
('Interstellar', 'Sci-Fi', 8.6, 'Now Showing'),
('The Godfather', 'Crime', 9.2, 'Now Showing'),
('Dune: Part Two', 'Sci-Fi', 8.3, 'Upcoming'),
('The Matrix', 'Action', 8.7, 'Now Showing'),
('Toy Story 5', 'Animation', 7.5, 'Upcoming'),
('Joker 2', 'Drama', 8.9, 'Upcoming');
select*from movie;
CREATE TABLE MovieCast (
    cast_id INT AUTO_INCREMENT PRIMARY KEY,
    person_name VARCHAR(100) NOT NULL,
    role VARCHAR(100) NOT NULL,
    movie_id INT NOT NULL,
    FOREIGN KEY (movie_id) REFERENCES Movie(movie_id)
);
INSERT INTO MovieCast (person_name, role, movie_id) VALUES
('Leonardo DiCaprio', 'Cobb', 1),
('Joseph Gordon-Levitt', 'Arthur', 1),
('Elliot Page', 'Ariadne', 1);
INSERT INTO MovieCast (person_name, role, movie_id) VALUES
('vijay', 'leo', 2),
('ajith', 'ak', 2),
('rajinikanth', 'pettai', 2);
select*from Moviecast;
CREATE TABLE showtime (
    show_id INT AUTO_INCREMENT PRIMARY KEY,
    screen_id INT NOT NULL,
    movie_id INT NOT NULL,
    show_datetime DATETIME NOT NULL,
    FOREIGN KEY (screen_id) REFERENCES screen(screen_id),
    FOREIGN KEY (movie_id) REFERENCES Movie(movie_id)
);
INSERT INTO Showtime (screen_id, movie_id, show_datetime) VALUES
(1, 1, '2025-06-12 10:30:00');
INSERT INTO Showtime (screen_id, movie_id, show_datetime) VALUES
(2, 2, '2025-06-12 14:00:00');
SELECT * FROM Movie
ORDER BY movie_id
LIMIT 5 OFFSET 5;
SELECT * FROM Movie
ORDER BY movie_id
LIMIT 5 OFFSET 10;
CREATE TABLE ShowSeat (
    show_seat_id INT AUTO_INCREMENT PRIMARY KEY,
    show_id INT NOT NULL,
    seat_id INT NOT NULL,
    is_available BOOLEAN NOT NULL DEFAULT TRUE,
    FOREIGN KEY (show_id) REFERENCES Showtime(show_id),
    FOREIGN KEY (seat_id) REFERENCES Seat(seat_id)
);
SELECT * FROM Showtime;
SELECT * FROM Seat;
INSERT INTO ShowSeat (show_id, seat_id, is_available) VALUES
(2, 7, TRUE),
(2, 8, TRUE),
(2, 9, FALSE),
(2, 10, TRUE),
(2, 11, FALSE);
alter table Movie add language varchar(50);
UPDATE ShowSeat
SET is_available = TRUE
WHERE show_id = 2;
SELECT * FROM ShowSeat WHERE show_id = 2;
CREATE TABLE User (
    user_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(150) NOT NULL,
    phone VARCHAR(15)
);
INSERT INTO User (name, email, phone) VALUES
('mani', 'mani@example.com', '1234567810'),
('kani', 'kani@example.com', NULL),
('thnai', 'thani@example.com', '9876543210');
CREATE TABLE Membership (
    membership_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    current_points INT NOT NULL DEFAULT 0,
    FOREIGN KEY (user_id) REFERENCES User(user_id)
);
INSERT INTO Membership (user_id) VALUES
(1),
(2),
(3);
CREATE TABLE Booking (
    booking_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    show_id INT NOT NULL,
    booking_datetime DATETIME NOT NULL,
    total_cost DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (user_id) REFERENCES User(user_id),
    FOREIGN KEY (show_id) REFERENCES Showtime(show_id)
);
INSERT INTO Booking (user_id, show_id, booking_datetime, total_cost) VALUES
(1, 1, '2025-06-11 12:30:00', 450.00),
(2, 2, '2025-06-11 13:00:00', 300.00);
CREATE TABLE Ticket (
    ticket_id INT AUTO_INCREMENT PRIMARY KEY,
    booking_id INT NOT NULL,
    show_seat_id INT NOT NULL,
    qr_code VARCHAR(100) NOT NULL,
    delivery_method VARCHAR(50) NOT NULL,
    is_downloaded BOOLEAN NOT NULL DEFAULT FALSE,
    scanned_at DATETIME DEFAULT NULL,
    FOREIGN KEY (booking_id) REFERENCES Booking(booking_id),
    FOREIGN KEY (show_seat_id) REFERENCES ShowSeat(show_seat_id)
);
INSERT INTO Ticket (booking_id, show_seat_id, qr_code, delivery_method)
VALUES
(1, 6, 'QR123456ABC', 'App'),
(2, 6, 'QR654321DEF', 'WhatsApp');
select *from movie where rating > 6.0;
select *from movie where rating between 6.0 and 8.5;
select *from moviecast where person_name like 'v%' ;
select *from moviecast where person_name is not null;
select *from moviecast where person_name is  null;
select *from movie where rating = 8.3;    
CREATE TABLE Review (
    review_id INT AUTO_INCREMENT PRIMARY KEY,
    movie_id INT NOT NULL,
    content TEXT NOT NULL,
    review_date DATETIME NOT NULL CHECK (review_date >= '2020-01-01 00:00:00'),
    FOREIGN KEY (movie_id) REFERENCES Movie(movie_id)
);
INSERT INTO Review (movie_id, content, review_date)
VALUES
(1, 'Amazing movie with great acting and direction.', '2025-06-10 14:30:00'),
(2, 'Good storyline but could have been shorter.', '2025-06-09 18:45:00'),
(3, 'Not as expected. Poor visual effects.', '2025-06-08 16:15:00'),
(1, 'Loved the soundtrack! Would watch again.', '2025-06-11 10:20:00'),
(2, 'Decent movie. Performances were okay.', '2025-06-11 12:05:00');
CREATE TABLE PaymentGateway (
    gateway_id INT AUTO_INCREMENT PRIMARY KEY,      
    name VARCHAR(100) NOT NULL UNIQUE               
);
INSERT INTO PaymentGateway (name)
VALUES
('PayPal'),
('Bill Desk'),
('Razorpay'),
('Stripe');
CREATE TABLE Payment (
    payment_id INT AUTO_INCREMENT PRIMARY KEY,                       
    booking_id INT NOT NULL,                                         
    gateway_id INT NOT NULL,                                          
    transaction_amount DECIMAL(10,2) NOT NULL,                        
    transaction_datetime DATETIME NOT NULL,                          
    status VARCHAR(20) NOT NULL CHECK (status IN ('Completed', 'Failed', 'Pending')), 
    failure_reason TEXT DEFAULT NULL,                                 
    credit_card_name VARCHAR(100) DEFAULT NULL,                      
    credit_card_number VARCHAR(20) DEFAULT NULL,                      
    expiry_date DATE DEFAULT NULL,                                    
    
    FOREIGN KEY (booking_id) REFERENCES Booking(booking_id),
    FOREIGN KEY (gateway_id) REFERENCES PaymentGateway(gateway_id)
);
INSERT INTO Payment (
    booking_id, gateway_id, transaction_amount, transaction_datetime, status,
    failure_reason, credit_card_name, credit_card_number, expiry_date
)
VALUES
(101, 1, 899.99, '2025-06-11 15:45:00', 'Completed', NULL, 'John Doe', '4111111111111111', '2027-04-01'),
(102, 2, 450.50, '2025-06-10 10:30:00', 'Failed', 'Insufficient funds', NULL, NULL, NULL);
CREATE TABLE FoodItem (
    item_id INT AUTO_INCREMENT PRIMARY KEY,      
    name VARCHAR(100) NOT NULL,                   
    description TEXT DEFAULT NULL,                
    is_combo BOOLEAN NOT NULL DEFAULT FALSE      
);
INSERT INTO FoodItem (name, description, is_combo)
VALUES
('Veg Burger', 'A crispy veggie burger with lettuce and tomato.', FALSE),
('Family Meal Combo', 'Includes 2 burgers, 2 fries, and 2 drinks.', TRUE),
('French Fries', NULL, FALSE),
('Chicken Popcorn', 'Spicy and crispy chicken popcorn.', FALSE);
CREATE TABLE FoodItemSize (
    size_id INT AUTO_INCREMENT PRIMARY KEY,              
    item_id INT NOT NULL,                                
    size_name VARCHAR(50) NOT NULL,                      
    rate DECIMAL(10,2) NOT NULL,                        
    FOREIGN KEY (item_id) REFERENCES FoodItem(item_id)   
);
CREATE TABLE PointsTransaction (
    transaction_id INT AUTO_INCREMENT PRIMARY KEY,                  
    user_id INT NOT NULL,                                           
    amount DECIMAL(10,2) NOT NULL,                                  
    points_earned INT NOT NULL,                                    
    transaction_datetime DATETIME NOT NULL,                        
    transaction_type VARCHAR(20) NOT NULL CHECK 
        (transaction_type IN ('Booking', 'Food', 'Redemption')),    
    FOREIGN KEY (user_id) REFERENCES User(user_id)                 
);
INSERT INTO PointsTransaction (user_id, amount, points_earned, transaction_datetime, transaction_type)
VALUES
(1, 500.00, 50, '2025-06-10 14:00:00', 'Booking'),
(2, 120.00, 12, '2025-06-11 13:30:00', 'Food'),
(3, 0.00, -20, '2025-06-11 15:00:00', 'Redemption');

-- limit and offset

SELECT * FROM Movie
ORDER BY movie_id
LIMIT 5 OFFSET 5;
SELECT * FROM Movie
ORDER BY movie_id
LIMIT 5 OFFSET 10;

-- using Aggregate function from the tables
-- count;

select count(*) from seat where screen_id=2;
select * from screen order by name Desc,screen_id asc;
select*from screen;

-- order by

select*from screen order by capacity desc,class_type asc;
INSERT INTO screen VALUES (11, 'K', 'Iron', 140);
INSERT INTO screen VALUES (12, 'L', 'Silver', 140);
select*from screen order by capacity desc,class_type asc;

-- max and min:

SELECT name, MAX(capacity) AS max_capacity, MIN(class_type) AS class_type
FROM screen
GROUP BY name;
select class_type,sum(capacity) as summm from screen group by class_type;

-- average

SELECT class_type, AVG(capacity) AS avg_capacity
FROM screen
GROUP BY class_type;
SELECT class_type, AVG(capacity) AS avg_capacity
FROM screen
GROUP BY class_type having avg(capacity)>100;

-- joins in db
-- inner join 

select * from screen inner join seat on screen.screen_id=seat.screen_id inner join showseat on seat.seat_id=showseat.seat_id;

SELECT 
    Ticket.ticket_id,
    User.name AS user_name,
    Movie.title AS movie_title,
    Screen.name AS screen_name
FROM Ticket
INNER JOIN Booking ON Ticket.booking_id = Booking.booking_id
INNER JOIN User ON Booking.user_id = User.user_id
INNER JOIN Showtime ON Booking.show_id = Showtime.show_id
INNER JOIN Movie ON Showtime.movie_id = Movie.movie_id
INNER JOIN Screen ON Showtime.screen_id = Screen.screen_id;

-- left join 

select * from screen left join seat on screen.screen_id=seat.screen_id left join showseat on showseat.seat_id=seat.seat_id;

SELECT 
    Screen.name AS screen_name,
    Seat.seat_number,
    ShowSeat.is_available
FROM Screen
LEFT JOIN Seat ON Screen.screen_id = Seat.screen_id
LEFT JOIN ShowSeat ON Seat.seat_id = ShowSeat.seat_id
LEFT JOIN Showtime ON ShowSeat.show_id = Showtime.show_id;

-- right join

select * from screen right join seat on screen.screen_id=seat.screen_id;

SELECT 
    MovieCast.person_name,
    MovieCast.role,
    Movie.title
FROM Movie RIGHT JOIN MovieCast ON Movie.movie_id = MovieCast.movie_id
RIGHT JOIN Review ON Review.movie_id = MovieCast.movie_id
RIGHT JOIN MovieCast AS MC2 ON MC2.movie_id = MovieCast.movie_id;

-- outer join 

select * from screen left join seat on screen.screen_id=seat.screen_id
union 
select *from screen right join seat on screen.screen_id=seat.screen_id;

SELECT 
    Screen.screen_id,
    Screen.name AS screen_name,
    Seat.seat_id,
    Seat.seat_number
FROM Screen
LEFT JOIN Seat ON Screen.screen_id = Seat.screen_id

UNION

SELECT 
    Screen.screen_id,
    Screen.name AS screen_name,
    Seat.seat_id,
    Seat.seat_number
FROM Screen
RIGHT JOIN Seat ON Screen.screen_id = Seat.screen_id;


-- self join

SELECT 
    s1.name AS Main_Screen,
    s1.class_type,
    s2.name AS Backup_Screen,
    s2.class_type AS Backup_Class
FROM 
    screen s1
LEFT JOIN screen s2
    ON s1.screen_id = s2.screen_id;
    
-- distinct values

select distinct capacity from screen;
select distinct *from screen;

-- union all

select * from screen left join seat on  screen.screen_id=seat.screen_id  
union all 

select * from screen right join seat on screen.screen_id=seat.screen_id;

-- cross join

SELECT s.name AS screen_name, m.title AS movie_title
FROM screen s
CROSS JOIN movie m;

-- date format

SELECT EXTRACT(YEAR FROM NOW());

SELECT DATE_FORMAT(NOW(), '%W');

SELECT DAY('2025-06-12');

select month('2025-06-12');

select year('2025-06-12');

SELECT NOW();

SELECT CURRENT_TIMESTAMP;

SELECT DATEDIFF('2025-06-12', '2025-01-01'); 

SELECT TIMESTAMPDIFF(hour, '2000-01-01', NOW());

SELECT TIMESTAMPDIFF(minute, '2000-01-01', NOW());

SELECT TIMESTAMPDIFF(second, '2000-01-01', NOW());

SELECT STR_TO_DATE('2025-06-12', '%Y-%m-%d');

SELECT MAKETIME(14, 30, 0);

SELECT DATE_ADD(NOW(), INTERVAL 5 DAY);

SELECT LAST_DAY('2025-06-12'); 

SELECT CONVERT_TZ(NOW(), '+00:00', '+05:30');

-- STRING FUNCTIONS
-- length function

SELECT NAME,length(class_type) as length from screen;

-- left trim function

insert into screen values(13,' C','Gold',230);
select *from screen;
select trim(name) as new from screen;

-- right trim function

insert into screen values(14,'V ','Gold',230);
select * from screen;
select rtrim(name) as new from screen;

-- upper and lower

select upper(class_type) from screen;
select lower(class_type) from screen;

-- left

select class_type ,left(class_type,2) as shorttype from screen;

-- right

select class_type ,right(class_type,2) as backtype from screen;

--  substring

select class_type,name ,substring(class_type,4) as classtype_small  from screen ;

-- replace

select replace(class_type,'G','p')as rep from screen;

-- concat

select concat('<',class_type,'>') from screen;

-- reverse

select reverse(class_type) as backtype from screen;

-- case 

select capacity ,case when capacity > 100 then 'bigger'  when capacity <=100 then 'smaller' end as type_capacity from screen;

select name, class_type from (select*from screen order by capacity DEsc limit 2 offset 2) as total_capacity ;
select *from screen;

select * from screen where capacity in (select capacity from screen where capacity = 140);
SELECT * 
FROM screen s1
WHERE EXISTS (
  SELECT 1 
  FROM screen s2 
  WHERE s2.capacity = 140
);





-- case

select capacity ,case when capacity > 100 then 'bigger'  when capacity <=100 then 'smaller' end as type_capacity from screen;

select name, class_type from (select*from screen order by capacity DEsc limit 2 offset 2) as total_capacity ;
select *from screen;

select * from screen where capacity in (select capacity from screen where capacity = 140);
SELECT *
FROM screen s1
WHERE EXISTS (
  SELECT 1
  FROM screen s2
  WHERE s2.capacity = 140
);

SELECT *
FROM screen
WHERE (class_type, capacity) = (
  SELECT class_type, capacity
  FROM screen
  WHERE screen_id = 2
);
SELECT class_type, avg_capacity
FROM (
  SELECT class_type, AVG(capacity) AS avg_capacity
  FROM screen
  GROUP BY class_type
) AS avg_table where avg_capacity>120;

SELECT *
FROM screen s1
WHERE capacity > (
  SELECT AVG(capacity)
  FROM screen s2
  WHERE s1.class_type = s2.class_type
);

select avg(capacity) from screen;

SELECT *
FROM screen s1
WHERE NOT EXISTS (
  SELECT 1
  FROM screen s2
  WHERE s2.capacity = 140
);

SELECT *
FROM screen
WHERE capacity > ANY (
  SELECT capacity
  FROM screen
  WHERE class_type= 'Silver'
);
select *from screen;
insert into screen(name,class_type,capacity) values('K','gold',200);
select name,class_type,capacity as second_highest from screen order by capacity desc limit 1;

CREATE TABLE Customerstable (
    customer_id INT auto_increment PRIMARY KEY,
    name VARCHAR(100),
    email VARCHAR(100),
    city VARCHAR(50),
    created_at DATE
);

CREATE TABLE Products (
    product_id INT auto_increment PRIMARY KEY,
    name VARCHAR(100),
    category VARCHAR(50),
    price DECIMAL(10, 2),
    stock INT
);

CREATE TABLE Orderstable (
    order_id INT auto_increment PRIMARY KEY,
    customer_id INT,
    product_id INT,
    quantity INT,
    order_date DATE,
    total_price DECIMAL(10, 2),
    FOREIGN KEY (customer_id) REFERENCES Customerstable(customer_id),
    FOREIGN KEY (product_id) REFERENCES Products(product_id)
);

INSERT INTO Customerstable (name, email, city, created_at)
VALUES 
('Alice', 'alice@example.com', 'New York', '2023-01-01'),
('Bob', 'bob@example.com', 'Los Angeles', '2023-02-15'),
('Charlie', 'charlie@example.com', 'Chicago', '2023-03-20');

INSERT INTO Products (name, category, price, stock)
VALUES
('Laptop', 'Electronics', 999.99, 50),
('Phone', 'Electronics', 499.99, 100),
('Desk', 'Furniture', 199.99, 20);

INSERT INTO Orderstable (order_id, customer_id, product_id, quantity, order_date, total_price)
VALUES
(1, 1, 1, 2, '2023-04-01', 1999.98),
(2, 2, 2, 1, '2023-05-01', 499.99),
(3, 3, 3, 1, '2023-06-01', 199.99);

select* from Customerstable;
select* from Products;
select* from Orderstable;

--  joining two table using join
SELECT order_id, name AS customer_name, total_price 
FROM Orderstable 
JOIN Customerstable  ON Orderstable .customer_id = Customerstable.customer_id;

select s.name,s.capacity,v.seat_number from screen s inner join seat v on s.screen_id=v.screen_id;

-- using distinct keyword;
SELECT DISTINCT c.name
FROM Customerstable c
JOIN Orderstable o ON c.customer_id = o.customer_id
WHERE YEAR(o.order_date) = 2023;


SELECT p.name AS product_name, SUM(o.quantity) AS total_sold, SUM(o.total_price) AS total_revenue
FROM Orderstable o
JOIN Products p ON o.product_id = p.product_id
GROUP BY p.name;

select distinct sum(s.capacity) as total_capacity,s.class_type from screen s join seat v on s.screen_id = v.screen_id group by s.class_type;
-- Identify the product with the highest revenue.

SELECT p.name AS product_name, SUM(o.total_price) AS revenue
FROM Orderstable o
JOIN Products p ON o.product_id = p.product_id
GROUP BY p.name
ORDER BY revenue DESC
LIMIT 1 offset 1;

select max(capacity) from screen where capacity<(select max(capacity) from screen);
select name,capacity from screen order by capacity desc limit 1 offset 1;
-- Calculate the average order value per customer.
SELECT c.name AS customer_name, AVG(o.total_price) AS avg_order_value
FROM Customerstable c
JOIN Orderstable o ON c.customer_id = o.customer_id
GROUP BY c.name;


SELECT DISTINCT c.name
FROM Customerstable c
JOIN Orderstable o ON c.customer_id = o.customer_id
JOIN Products p ON o.product_id = p.product_id
WHERE p.stock < 30;


ALTER TABLE Customerstable
ADD referrer_id INT;

alter table customerstable add newcol varchar(59);

UPDATE Customerstable
SET referrer_id = NULL
WHERE customer_id = 1;

update screen set capacity=capacity+20 where class_type='Gold';

UPDATE Customerstable
SET referrer_id = 1
WHERE customer_id IN (2, 3);
select*from customerstable;



UPDATE Customerstable
SET referrer_id = 2
WHERE customer_id = 4;

UPDATE Customerstable
SET referrer_id = 3
WHERE customer_id = 5;

select* from Customerstable;
select* from Products;
select* from Orderstable;

select * from products where price> (select avg(price) from products);

select max(price) from products where price < (select max(price) from products);

select count(*) from products group by category;

SELECT customer_id
    FROM Orderstable
    WHERE total_price > 500;

SELECT name, email FROM Customerstable WHERE customer_id IN (SELECT customer_id FROM Orderstable
    WHERE total_price > 500
);

SELECT product_id, name as product_name FROM products WHERE product_id not  IN (SELECT product_id FROM orderstable);

SELECT customer_id, COUNT(order_id) AS total_orders FROM orderstable
GROUP BY customer_id HAVING COUNT(order_id) > (SELECT AVG(total_orders) FROM (SELECT COUNT(order_id) AS total_orders
FROM orderstable GROUP BY customer_id) as avg_oders);


SELECT c.customer_id, c.name, c.email, 
    (SELECT COUNT(*)
     FROM Orderstable o
     WHERE o.customer_id = c.customer_id) AS total_orders
FROM Customerstable c;

SELECT name, email FROM Customerstable WHERE customer_id IN (SELECT customer_id FROM Orderstable GROUP BY customer_id HAVING SUM(total_price) > ( SELECT AVG(total_price)
FROM Orderstable )
);

select category,count(*) as count from products group by category having count(*)>1 ;

SELECT customer_id, order_id, product_id FROM orderstable WHERE product_id = (SELECT product_id FROM products
WHERE price = (SELECT MAX(price) FROM products));


start transaction;

update products set price=200.45 where name='phone';

commit;

savepoint b;

start transaction ;

update products set price=400.37 where name='phone';

select * from products;

rollback to b;

commit;

savepoint c;

update products set price=400.87 where name='phone';

select * from products;
rollback to c;
select * from products;
