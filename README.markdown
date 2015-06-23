# Railfan

 Railfan is an application with a few purposes.
 
 - Track all the trains you've riden on
 - Search and find trains you've yet to ride on, or search by location
 - Earn titles and compare your progress to others

### Trains

- id - integer
- name - string
- location_id - integer


### Locations

- id - integer
- name - Station Name - string


### Passenger

- id - integer
- name - string
- title - string

### Log

- The log will store the events.

- passenger_id - integer
- train_id - integer

## Should

The user should be able to search for trains by location, and should be able to buy a ticket to ride said train.

- Add/Edit/View/Delete Passenger
- Add/Edit/View/Delete Trains
- Add/Edit/View/Delete Locations
- Add/Edit/View/Delete Tracks
- Add/Edit/View/Delete TrainLog

- Should store an event anytime someone rides a train.
- There should be a way to retrieve all the trains a user has ridden (and the number of trains)
- Should update title for a user based on number of trains ridden
- Should be able to list all users based on ranking

## Should-not

- Be able to add a Log without a train/passenger
- Should not be able to have empty fields in Trains/Locations

##Requirements

-At least three models
-At least one one-to-many relationship
-At least one many-to-many relationship
-Unit tests for all business logic
-Ability to fully interact with the application from the browser