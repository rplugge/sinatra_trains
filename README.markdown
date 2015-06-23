# Railway System Database Manager

This will be a tool to help rail-way users find train times and stations.

### Stations

- id - integer
- name - string


### Tracks

- Tracks connect the stations, only 1 exists between two stations.

- id - integer
- name - string


### Trains

- id - integer
- name - string

### TrainLog

The individual rides between stations. Stores passengers who were on that train/which train it was

- id - integer
- date - string
- train_id - integer
- passengers - string

### Passenger

The individual passenger, should have id, name, and should store their current ticket if they have one. 


## Should

The user should be able to search for trains by location, and should be able to buy a ticket to ride said train.

- Add/Edit/View/Delete Passenger
- Add/Edit/View/Delete Trains
- Add/Edit/View/Delete Stations
- Add/Edit/View/Delete Tracks
- Add/Edit/View/Delete TrainLog
- Be able to buy a ticket, and once the train has run remove all tickets that were used.

## Should-not

- Be able to ride trains between non-connected stations
- Add Passenger log without information
- Be able to add a railways that already exists

##Requirements

-At least three models
-At least one one-to-many relationship
-At least one many-to-many relationship
-Unit tests for all business logic
-Ability to fully interact with the application from the browser