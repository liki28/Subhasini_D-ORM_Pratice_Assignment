create database TravelOnTheGo;
use TravelOnTheGo;
-- 1 --
create table PASSENGER (
 Id		        int auto_increment primary key,
 Passenger_name         varchar(50), 
  Category               varchar(20),
   Gender                 varchar(20),
   Boarding_City      varchar(50),
   Destination_City   varchar(50),
  Distance                int,
  Bus_Type             varchar(30)

);
create table PRICE(
Bus_Type              varchar(30),
Distance  int,
Price int

);

-- 2--
insert into passenger values (default,'Sejal','AC','F','Bengaluru','Chennai',350,'Sleeper');
insert into passenger values (default,'Anmol','Non-AC','M','Mumbai','Hyderabad',700,'Sitting');
insert into passenger values (default,'Pallavi','AC','F','Panaji','Bengaluru',600,'Sleeper');
insert into passenger values (default,'Khusboo','AC','F','Chennai','Mumbai',1500,'Sleeper');
insert into passenger values (default,'Udit','Non-AC','M','Trivandrum','panaji',1000,'Sleeper');
insert into passenger values (default,'Ankur','AC','M','Nagpur','Hyderabad',500,'Sitting');
insert into passenger values (default,'Hemant','Non-AC','M','panaji','Mumbai',700,'Sleeper');
insert into passenger values (default,'Manish','Non-AC','M','Hyderabad',' Bengaluru',500,'Sitting');
insert into passenger values (default,'Piyush','AC','M','Pune','Nagpur',700,'Sitting');

select * from passenger;

insert into price values('Sleeper',350,770);
insert into price values('Sleeper',500,1100);
insert into price values('Sleeper',600,1320);
insert into price values('Sleeper',700,1540);
insert into price values('Sleeper',1000,2200);
insert into price values('Sleeper',1200,2640);
insert into price values('Sleeper',1500,2700);
insert into price values('Sitting',500,620);
insert into price values('Sitting',600,744);
insert into price values('Sitting',700,868);
insert into price values('Sitting',1000,1240);
insert into price values('Sitting',1200,1488);
insert into price values('Sitting',1500,1860);

select *from price;

-- 3--
-- How many females and how many male passengers travelled 
-- for a minimum distance of 600 KM s?
select gender ,count(Gender) as Count from Passenger where Distance>=600 group by Gender;

-- 4--
-- 	Find the minimum ticket price for Sleeper Bus
select min(Price) as minimum_ticket_price from Price where Bus_Type='Sleeper';

-- 5--
-- Select passenger names whose names start with character 'S' 
select Passenger_Name from Passenger where Passenger_Name like 's%';

-- 6--
-- Calculate price charged for each passenger displaying 
-- Passenger name, Boarding City, Destination City, Bus_Type, Price in the output
select a.passenger_name,a.Boarding_city,a.Destination_city,a.Bus_Type,b.Price from
Passenger a,Price b where (a.Bus_Type=b.Bus_Type and a.Distance=b.Distance);

-- 7--
-- 7)	What are the passenger name/s and his/her ticket price 
-- who travelled in the Sitting bus 
-- for a distance of 1000 KM s 
select a.Passenger_Name,b.Price from Passenger a,Price b where 
(a.Bus_Type="Sitting" and b.Bus_Type="Sitting"  and a.Distance=1000 and b.Distance=1000);

-- 8--
-- What will be the Sitting and Sleeper bus charge for Pallavi to travel from Bangalore to Panaji ?
select Price from  Price  where distance =(select Distance from passenger where Passenger_name="Pallavi" );

-- 9--
-- List the distances from the "Passenger" table which are unique (non-repeated distances) in descending order
select distinct(Distance) from passenger order by distance desc;

-- 10--
-- Display the passenger name and percentage of distance travelled by that passenger from
-- the total distance travelled by all passengers without using user variables 
select passenger_Name,(distance / (select sum(distance) from Passenger))*100 as percentage_travel from passenger;

-- 11--
-- 	Display the distance, price in three categories in table Price
-- a) Expensive if the cost is more than 1000
-- b) Average Cost if the cost is less than 1000 and greater than 500
-- c) Cheap otherwise
select Bus_Type, Distance, Price,
CASE
WHEN Price>1000 then "Expensive"
WHEN Price<1000 and Price>500 then "Average Cost"
ELSE "Cheap"
END as Cost from price;