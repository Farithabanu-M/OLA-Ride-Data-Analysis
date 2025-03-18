create database ola;
use ola;

#1. Retreive all successful bookings:
Create View Successful_Booking AS
select * from Bookings
where Booking_Status='Success';
select * from Successful_Booking;

#2. Find Average  ride distance for each vehicle type:
create View ride_distance_for_each_vehicle As
select Vehicle_Type, AVG(Ride_Distance)
as avg_distance FROM bookings
group by Vehicle_Type;
 
#3. Get the total number of cancelled rides by customers:
create view cancelled_rides_by_customers As
select count(*) FROM Bookings
where Booking_Status='Canceled by Customer';
select * from cancelled_rides_by_customers;

#4. List the top 5 customers who booked the highest number of rides:
create view top_5customers As
select Customer_ID, count(Booking_ID) AS total_rides
FROM bookings
group by Customer_ID
order by total_rides desc limit 5;
select * FROM top_5customers;

#5.Get the number of rides cancelled by drivers due to personal and car-related issues:
Create View Rides_cancelled_by_Drivers_P_C_Issues As
SELECT COUNT(*) FROM Bookings
WHERE `Canceled_Rides_by_Driver` = 'Personal & Car related issue';

#6. Find the maximum and minimum driver ratings for Prime Sedan bookings:
Create View Max_Min_Driver_Rating As
SELECT MAX(Driver_Ratings) as max_rating,
MIN(Driver_Ratings) as min_rating
FROM bookings WHERE Vehicle_Type = 'Prime Sedan';

#7. Retrieve all rides where payment was made using UPI:
Create View UPI_Payment As
SELECT * FROM bookings
WHERE Payment_Method = 'UPI';

#8. Find the average customer rating per vehicle type:
Create View AVG_Cust_Rating As
SELECT Vehicle_Type, AVG(Customer_Rating) as avg_customer_rating
FROM bookings
GROUP BY Vehicle_Type;

#9. Calculate the total booking value of rides completed successfully:
Create View total_successful_ride_value As
SELECT SUM(Booking_Value) as total_successful_ride_value
FROM bookings
WHERE Booking_Status = 'Success';

#10. List all incomplete rides along with the reason:
Create View Incomplete_Rides_Reason As
SELECT Booking_ID, Incomplete_Rides_Reason
FROM bookings
WHERE Incomplete_Rides = 'Yes';

