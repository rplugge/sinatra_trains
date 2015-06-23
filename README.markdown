# Railway System Database Manager

This will be a tool to help rail-way users find train times and stations.

### Stations

- id - integer
- name - string


### Railways

- Railways connect the stations, only 1 exists between each station.

- id - integer
- name - string


### Trains

- id - integer
- name - string

### Passenger log

The individuals who ride the trains.

- id - integer
- name - string
- train_id - integer


## Should

We should be able to;

- Add new passenger log
- View passenger log
- Add new trains
- Edit trains
- Delete trains
- View train information
- Add new stations
- Edit stations
- Delete stations
- View station information
- Add railways
- Delete railways
- View railways

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