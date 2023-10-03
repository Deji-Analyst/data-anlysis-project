USE new_york_citi_bikes;

SELECT * FROM new_york_citi_bikes;


(
# TOTAL USERS OF NEW YORK CITI BIKES

SELECT COUNT(user_type) "Count of Users"
FROM new_york_citi_bikes;
)


(
# TOTAL SUBSCRIBERS OF NEW YORK CITI BIKES

SELECT COUNT(user_type) "Count of Subscribers"
FROM new_york_citi_bikes
WHERE user_type = 'subscriber';
)


(
# TOTAL ONE-TIME USERS OF NEW YORK CITI BIKES

SELECT COUNT(user_type) "Count of One Time User"
FROM new_york_citi_bikes
WHERE user_type = 'one-time user';
)


(
# TOP 10 most popular pick-up locations across the city for NY Citi Bike rental

SELECT start_station_name, COUNT(start_station_name) No
FROM new_york_citi_bikes
GROUP BY start_station_name
ORDER BY No DESC
LIMIT 10;
)


(
# AGE GROUPS AND THEIR AVERAGE TRIP DURATION 

SELECT age_group , ROUND(AVG(trip_duration_in_min), 0) "Average Trip Duration/min"
FROM new_york_citi_bikes
GROUP BY age_group
ORDER BY age_group;
)


(
# Which Age Group rents the most Bikes?

SELECT age_group, COUNT(bike_id) Bike_Rental
FROM new_york_citi_bikes
GROUP BY age_group
ORDER BY Bike_Rental DESC;
)


(
# How bike rental vary across the two user groups (one-time users vs long-term subscribers) on different days of the week?

SELECT weekday, user_type,
COUNT(*) AS number_of_rentals
FROM new_york_citi_bikes
GROUP BY weekday, user_type
ORDER BY weekday;
)


(
# Does user age impact the average bike trip duration?

SELECT age, ROUND(AVG(trip_duration_in_min), 0) AS average_trip_duration
FROM new_york_citi_bikes
GROUP BY age;
)