# WARM UP Queries
#1 Finding the three most preferred mode of payments accepted
select Rpayment, count(placeID) from chefmozaccepts group by Rpayment order by count(placeID) Desc limit 5;

#2 Finding the most popular cuisines served
select Rcuisine, count(placeID) from chefmozcuisine group by Rcuisine order by count(placeID) Desc limit 1;

#3 Finding three most popular parking_lots used
select parking_lot, count(placeID) from chefmozparking group by parking_lot order by count(placeID) Desc limit 3;

#4 Average ratings received by Places
select avg(rating), placeID from rating_final group by placeID;

#5 Max food ratings received by Places
select max(food_rating), placeID from rating_final group by placeID;

#6 Avg food ratings received by Places
select avg(food_rating), placeID from rating_final group by placeID;

#7 Min food ratings received by Places
select min(food_rating), placeID from rating_final group by placeID;

#8 Min service ratings received by Places
select min(service_rating), placeID from rating_final group by placeID;

#9 Max service ratings received by Places
select max(service_rating), placeID from rating_final group by placeID;

#10 Avg service ratings received by places
select avg(service_rating), userID from rating_final group by placeID;

#11 Finding the most popular cuisines among users
select Rcuisine, count(userID) from usercuisine group by Rcuisine order by count(userID) Desc limit 1;

#12 Finding the most popular payments used
select Upayment, count(userID) from userpayment group by Upayment order by count(userID) Desc limit 1;



# INFERENCES AFTER COMPARING
#13 Smoking behavior
select smoker, count(userID) from userprofile group by smoker;

#14 Smoking area
select smoking_area, count(placeID) from geoplaces group by smoking_area;

#15 Drinking Behavior
select drink_level, count(userID) from userprofile group by drink_level;

#16 Alcohol
select alcohol, count(placeID) from geoplaces group by alcohol;

#17 Dressing behavior
select dress_preference, count(userID) from userprofile group by dress_preference;

#18 Dress code
select dress_code, count(placeID) from geoplaces group by dress_code;

#19 accompanying people kind
select ambience, count(userID) from userprofile group by ambience;

#20 Ambience
select Rambience, count(placeID) from geoplaces group by Rambience;

#21 budget
select budget, count(userID) from userprofile group by budget;

#22 price
select price, count(placeID) from geoplaces group by price;



#Simple Join
#23 24 25 USERPROFILE AND USER MoP
select Upayment, count(userprofile.userID)
from userpayment
join userprofile
on userpayment.userID = userprofile.userID
where budget = "low"
group by Upayment;

select Upayment, count(userprofile.userID)
from userpayment
join userprofile
on userpayment.userID = userprofile.userID
where budget = "medium"
group by Upayment;

select Upayment, count(userprofile.userID)
from userpayment
join userprofile
on userpayment.userID = userprofile.userID
where budget = "high"
group by Upayment;


#Sub Query
# MoP, cuisines and parking lots with Ratings, food and service raqtings from rating final
#26 Avg Ratings recieved as per mode of payment
Select c.Rpayment, count(Average.placeID), avg(Average.AvgRating)
from chefmozaccepts as c,
	(select avg(rating) as AvgRating, placeID from rating_final group by placeID
    ) as Average
where c.placeID = Average.placeID 
group by Rpayment
order by avg(Average.AvgRating);

#27 Avg food Ratings recieved as per mode of payment
Select c.Rpayment, count(Average.placeID), avg(Average.AvgRating)
from chefmozaccepts as c,
	(select avg(food_rating) as AvgRating, placeID from rating_final group by placeID
    ) as Average
where c.placeID = Average.placeID 
group by Rpayment
order by avg(Average.AvgRating);

#28 Avg service Ratings recieved as per mode of payment
Select c.Rpayment, count(Average.placeID), avg(Average.AvgRating)
from chefmozaccepts as c,
	(select avg(service_rating) as AvgRating, placeID from rating_final group by placeID
    ) as Average
where c.placeID = Average.placeID 
group by Rpayment
order by avg(Average.AvgRating);

#29 Avg Ratings recieved as per cuisines served.
Select c.Rcuisine, count(Average.placeID), avg(Average.AvgRating)
from chefmozcuisine as c,
	(select avg(rating) as AvgRating, placeID from rating_final group by placeID
    ) as Average
where c.placeID = Average.placeID 
group by Rcuisine
order by avg(Average.AvgRating);

#30 Avg food Ratings recieved as per cuisines served.
Select c.Rcuisine, count(Average.placeID), avg(Average.AvgRating)
from chefmozcuisine as c,
	(select avg(food_rating) as AvgRating, placeID from rating_final group by placeID
    ) as Average
where c.placeID = Average.placeID 
group by Rcuisine
order by avg(Average.AvgRating);

#31 Avg service Ratings recieved as per cuisines served.
Select c.Rcuisine, count(Average.placeID), avg(Average.AvgRating)
from chefmozcuisine as c,
	(select avg(service_rating) as AvgRating, placeID from rating_final group by placeID
    ) as Average
where c.placeID = Average.placeID 
group by Rcuisine
order by avg(Average.AvgRating);

#32 Avg Ratings recieved as per parking lots used.
Select c.parking_lot, count(Average.placeID), avg(Average.AvgRating)
from chefmozparking as c,
	(select avg(rating) as AvgRating, placeID from rating_final group by placeID
    ) as Average
where c.placeID = Average.placeID 
group by parking_lot
order by avg(Average.AvgRating);

#33 Avg food Ratings recieved as per parking lots used.
Select c.parking_lot, count(Average.placeID), avg(Average.AvgRating)
from chefmozparking as c,
	(select avg(food_rating) as AvgRating, placeID from rating_final group by placeID
    ) as Average
where c.placeID = Average.placeID 
group by parking_lot
order by avg(Average.AvgRating);

#34 Avg service Ratings recieved as per parking lots used.
Select c.parking_lot, count(Average.placeID), avg(Average.AvgRating)
from chefmozparking as c,
	(select avg(service_rating) as AvgRating, placeID from rating_final group by placeID
    ) as Average
where c.placeID = Average.placeID 
group by parking_lot
order by avg(Average.AvgRating);


# GEOPLACES AND RATING FINAL
#35 Avg Ratings recieved as per alcohol
Select c.alcohol, count(Average.placeID), avg(Average.AvgRating)
from geoplaces as c,
	(select avg(rating) as AvgRating, placeID from rating_final group by placeID
    ) as Average
where c.placeID = Average.placeID 
group by alcohol
order by avg(Average.AvgRating);

#36 Avg Ratings recieved as per smoking area
Select c.smoking_area, count(Average.placeID), avg(Average.AvgRating)
from geoplaces as c,
	(select avg(rating) as AvgRating, placeID from rating_final group by placeID
    ) as Average
where c.placeID = Average.placeID 
group by smoking_area
order by avg(Average.AvgRating);

#37 Avg Ratings recieved as per price
Select c.price, count(Average.placeID), avg(Average.AvgRating)
from geoplaces as c,
	(select avg(rating) as AvgRating, placeID from rating_final group by placeID
    ) as Average
where c.placeID = Average.placeID 
group by price
order by avg(Average.AvgRating);

#38 Avg Ratings recieved as per accessibility
Select c.accessibility, count(Average.placeID), avg(Average.AvgRating)
from geoplaces as c,
	(select avg(rating) as AvgRating, placeID from rating_final group by placeID
    ) as Average
where c.placeID = Average.placeID 
group by accessibility
order by avg(Average.AvgRating);


#USERPROFILE AND RATING FINAL
#39 Avg Ratings givven grouped by drinking behavior
Select c.drink_level, count(Average.userID), avg(Average.AvgRating)
from userprofile as c,
	(select avg(rating) as AvgRating, userID from rating_final group by userID
    ) as Average
where c.userID = Average.userID 
group by drink_level
order by avg(Average.AvgRating);

#40 Avg Ratings givven grouped by transportation
Select c.transport, count(Average.userID), avg(Average.AvgRating)
from userprofile as c,
	(select avg(rating) as AvgRating, userID from rating_final group by userID
    ) as Average
where c.userID = Average.userID 
group by transport
order by avg(Average.AvgRating);

#41 Avg Ratings given grouped by marital status
Select c.marital_status, count(Average.userID), avg(Average.AvgRating)
from userprofile as c,
	(select avg(rating) as AvgRating, userID from rating_final group by userID
    ) as Average
where c.userID = Average.userID 
group by marital_status
order by avg(Average.AvgRating);

#42 Avg Ratings given grouped by interest
Select c.interest, count(Average.userID), avg(Average.AvgRating)
from userprofile as c,
	(select avg(rating) as AvgRating, userID from rating_final group by userID
    ) as Average
where c.userID = Average.userID 
group by interest
order by avg(Average.AvgRating);

#43 Avg Ratings givven grouped by personality
Select c.personality, count(Average.userID), avg(Average.AvgRating)
from userprofile as c,
	(select avg(rating) as AvgRating, userID from rating_final group by userID
    ) as Average
where c.userID = Average.userID 
group by personality
order by avg(Average.AvgRating);

#44 Avg Ratings givven grouped by religion
Select c.religion, count(Average.userID), avg(Average.AvgRating)
from userprofile as c,
	(select avg(rating) as AvgRating, userID from rating_final group by userID
    ) as Average
where c.userID = Average.userID 
group by religion
order by avg(Average.AvgRating);

#45 Avg Ratings givven grouped by profession/activity
Select c.activity, count(Average.userID), avg(Average.AvgRating)
from userprofile as c,
	(select avg(rating) as AvgRating, userID from rating_final group by userID
    ) as Average
where c.userID = Average.userID 
group by activity
order by avg(Average.AvgRating);

#46 Avg Ratings givven grouped by budget
Select c.budget, count(Average.userID), avg(Average.AvgRating)
from userprofile as c,
	(select avg(rating) as AvgRating, userID from rating_final group by userID
    ) as Average
where c.userID = Average.userID 
group by budget
order by avg(Average.AvgRating);

# join using Three tables
#GEO AND USER
#47 48 49 Checking where the respective budget category people are going the most(high/med/low price rest.)
select count(geoplaces.placeID), price
from geoplaces, (select userID, budget from userprofile where budget = "low") a, rating_final
where geoplaces.placeID = rating_final.placeID
and a.userID = rating_final.userID
group by price;

select count(geoplaces.placeID), price
from geoplaces, (select userID, budget from userprofile where budget = "medium") a, rating_final
where geoplaces.placeID = rating_final.placeID
and a.userID = rating_final.userID
group by price;

select count(geoplaces.placeID), price
from geoplaces, (select userID, budget from userprofile where budget = "high") a, rating_final
where geoplaces.placeID = rating_final.placeID
and a.userID = rating_final.userID
group by price;

#50 51 52 53 Checking where the respective activity category are going the most(high/med/low price rest.)
select count(geoplaces.placeID), price
from geoplaces, (select userID, activity from userprofile where activity =	 "student") a, rating_final
where geoplaces.placeID = rating_final.placeID
and a.userID = rating_final.userID
group by price;

select count(geoplaces.placeID), price
from geoplaces, (select userID, activity from userprofile where activity = "professional") a, rating_final
where geoplaces.placeID = rating_final.placeID
and a.userID = rating_final.userID
group by price;

select count(geoplaces.placeID), price
from geoplaces, (select userID, activity from userprofile where activity = "unemployed" or activity = "jobless") a, rating_final
where geoplaces.placeID = rating_final.placeID
and a.userID = rating_final.userID
group by price;

select count(geoplaces.placeID), price
from geoplaces, (select userID, activity from userprofile where activity = "working-cl	ass") a, rating_final
where geoplaces.placeID = rating_final.placeID
and a.userID = rating_final.userID
group by price;

#54 Checking where the respective transport category people are going the most(high/med/low price rest.)
select count(geoplaces.placeID), price
from geoplaces, (select userID, activity from userprofile where transport = "public" or transport = "on foot") a, rating_final
where geoplaces.placeID = rating_final.placeID
and a.userID = rating_final.userID
group by price;


#USER AND PARKING
#55 Checking where the car owners are going to rest. with different parking lots
select count(chefmozparking.placeID), parking_lot
from chefmozparking, (select userID, budget from userprofile where transport = "car owner") a, rating_final
where chefmozparking.placeID = rating_final.placeID
and a.userID = rating_final.userID
group by parking_lot;

# INFERENCES without comparison
#56 transportation nature
select transport, count(userID) from userprofile group by transport;

#57 marital Status
select marital_status, count(userID) from userprofile group by marital_status;

#58 interest variance
select interest, count(userID) from userprofile group by interest;

#59 personality behavior
select personality, count(userID) from userprofile group by personality;

#60 religion charectiristic
select religion, count(userID) from userprofile group by religion;

#61 Profession 
select activity, count(userID) from userprofile group by activity;

#62 color
select color, count(userID) from userprofile group by color;

#63 Other Services
select other_services, count(placeID) from geoplaces group by other_services;





