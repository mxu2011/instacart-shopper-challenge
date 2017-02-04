# Instacart Shopper Challenge

This repository contains my solution to the Instacart Shopper Challenge. A sample version has been deployed [on Heroku](https://powerful-sands-52598.herokuapp.com/).


## Setup

Note that this application requires Ruby (tested with 2.3.1) and Postgres to be installed. Once this repository is cloned, navigate to the local project directory in the terminal and execute the following.

```bash
$ bundle install
$ rails db:create db:migrate db:seed
$ rails server
```

This will start the server. In the browser, navigate to `localhost:3000` to interact with the application.


## Application Design

### Interface

The application interface is extremely basic, built with [Twitter Bootstrap](https://getbootstrap.com/), and does not make deliberate use of JavaScript. The root path is a splash page with a button to fill in an application.

If the visitor navigates to the application, fills it in completely, and submits, a new applicant will be created in the database. They will then be brought to a page where they must accept a background check. Doing so will record the time at which they accepted and bring them to the applicant show page, which has their information. The show page links to an edit page, which allows the applicant to update their information.

There is no real authentication, but an applicant will be 'signed in' when they submit their application. Only one applicant can be 'signed in' at a time. The applicant will be 'signed out' when the browser session ends. There is no other means of signing in or out, but such features could be implemented fairly easily.

The views do not have test coverage.


### Database

This application is built three database tables, representing the applicants, possible states for those applicants, and the history of states for the applicants (a join table). Since the problem specification did not indicate the requirements for these states, the history is only a matter of record and not of application functionality.

A single database query is used to find the aggregate progress of applicants through the states, grouped by the week each applicant originally applied. It leverages Postgres' `date_trunc` function to perform this grouping. The seed file can be executed (`$ rake db:seed`) to pre-populate the database with a few thousand rows for testing this query (note that this will destroy any existing database entries).

I was not aware of an expedient way to calculate multiple sums using Rails ActiveRecord, so I elected to generate the query's select statement as a string. This complicates testing, and the query would be less maintainable as a result. In retrospect, it also seems that the query method should have been on the model that handled the states since it is more of an aggregate of those rows. Finally, the naming of the database tables could have been better, though "ApplicationState" might have been confusing.
