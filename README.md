# Sweater Weather

This application is for a project in Module 3 of Turing School of Software and Design's back-end engineering program called [Sweater Weather](https://backend.turing.io/module3/projects/sweater_weather).

Its design is based on wireframes provided by a fictitious front end development team that requires certain payloads of JSON data to be returned after an HTTP request it sent to an API the backend team creates.

### Data Returned

This application exposes several end points which the previously mentioned front end developer might call on. Explanations for what JSON-formatted content it responds with after a successful request are below:

- GET /api/v1/forecast?location=city,state_abbreviation
  * Weather data about the given location
- GET /api/v1/backgrounds?location=city,state_abbreviation
  * Data which includes an image URL which can be used as a background picture for the given location
- POST /api/v1/users
  * Information about a user which has been instantiated with proper attributes from the request
- POST /api/v1/sessions
  * Information about a user which has been verified by a properly-authenticated request
- POST /api/v1/road_trip
  * Road trip data which includes the origin, destination, travel time and forecast upon arriving at a destination

### Learning Goals Accomplished

* Expose an API that aggregates data from multiple external APIs
* Expose an API that requires an authentication token
* Expose an API for CRUD functionality
* Determine completion criteria based on the needs of other developers
* Research, select, and consume an API based on my needs as a developer
