create database Ola;
use Ola;

--  1. Retrieve all successful bookings:
CREATE View Successful_Bookings AS 
SELECT * FROM bookings WHERE Booking_Status= 'Success';
SELECT * FROM Successful_Bookings;


--  2. Find the average ride distance for each vehicle type:
CREATE View ride_distance_for_each_vehicle AS
SELECT Vehicle_Type,AVG(Ride_Distance) AS avg_distance
FROM bookings 
GROUP BY Vehicle_Type;
SELECT * FROM ride_distance_for_each_vehicle;


--  3. Get the total number of cancelled rides by customers:
CREATE View cancelled_ride_by_customer AS
SELECT COUNT(*)
FROM bookings
WHERE Booking_Status='Canceled by Customer';
SELECT * FROM cancelled_ride_by_customer;


--  4. List the top 5 customers who booked the highest number of rides:
CREATE View top_5_customers AS 
SELECT Customer_id,COUNT(Booking_ID) AS total_rides
FROM bookings 
GROUP BY Customer_id
ORDER BY total_rides DESC
LIMIT 5;
SELECT * FROM top_5_customers;


--  5. Get the number of rides cancelled by drivers due to personal and car-related issues:
CREATE View rides_cancelled_by_customer_due_to_pc_related_issue AS 
SELECT COUNT(*) 
FROM bookings 
WHERE Canceled_Rides_by_Driver='Personal & Car related issue';
SELECT * FROM rides_cancelled_by_customer_due_to_pc_related_issue;


--  6. Find the maximum and minimum driver ratings for Prime Sedan bookings:
CREATE View max_min_driver_ratings AS 
SELECT MAX(Driver_Ratings) AS max_driver_rating, 
MIN(Driver_Ratings) AS min_driver_rating
FROM bookings 
WHERE Vehicle_Type='Prime Sedan';
SELECT * FROM max_min_driver_ratings;

 
--  7. Retrieve all rides where payment was made using UPI:
CREATE View payment_method_UPI AS
SELECT * FROM bookings
WHERE Payment_Method='UPI';
SELECT * FROM payment_method_UPI;


--  8. Find the average customer rating per vehicle type:
CREATE View average_customer_rating AS
SELECT Vehicle_Type, AVG(Customer_Rating) AS avg_customer_rating
FROM  bookings
GROUP BY Vehicle_Type;
SELECT * FROM average_customer_rating;


--  9. Calculate the total booking value of rides completed successfully:
CREATE View total_booking_value AS
SELECT SUM(Booking_Value) AS total_booking_value
FROM bookings 
WHERE Booking_Status='Success';
SELECT * FROM total_booking_value;


--  10. List all incomplete rides along with the reason
CREATE View incomplete_ride_reason AS
SELECT Booking_ID,Incomplete_Rides_Reason
FROM bookings
WHERE Incomplete_Rides='Yes';


-- GETTING ALL THE DATA DIRECTLY USING VIEW 


 #1. Retrieve all successful bookings:
 Select * From Successful_Bookings;
 
 #2. Find the average ride distance for each vehicle type:
 Select * from ride_distance_for_each_vehicle;
 
 #3. Get the total number of cancelled rides by customers:
 Select * from cancelled_ride_by_customer;
 
 #4. List the top 5 customers whoo booked the highest number of rides:
 Select * from top_5_customers;
 
 #5. Get the number of rides cancelled by drivers due to personal and car-related issues:
 Select * from rides_cancelled_by_customer_due_to_pc_related_issue;
 
 #6. Find the maximum and minimum driver ratings for Prime Sedan bookings:
 Select * from max_min_driver_ratings;
 
 #7. Retrieve all rides where payment was made using UPI:
 Select * from payment_method_UPI;
 
 #8. Find the average customer rating per vehicle type:
 Select * from average_customer_rating;
 
 #9. Calculate the total booking value of rides completed successfully:
 Select * from total_booking_value;
 
 #10. List all incomplete rides along with the reason:
 Select * from incomplete_ride_reason