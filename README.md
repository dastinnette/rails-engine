## Rails Engine

[Project Outline](https://github.com/turingschool/lesson_plans/blob/master/ruby_03-professional_rails_applications/rales_engine.md)

This is the second individual project of Module 3 at the Turing School. Students have to use Rails and ActiveRecord to build a JSON API which exposes the SalesEngine data schema.

Sales Engine is the last project of Module 1. Students have to build a relational database and mimic
ActiveRecord query methods using just Ruby.

###### Instructions
* clone the project: `git clone git@github.com:dastinnette/rails-engine.git`
* bundle
* run the migrations with `rake db:migrate`
* load the data with `rake import`
* start the server with `rails s`

#### Learning Goals

* Learn how to to build Single-Responsibility controllers to provide a well-designed and versioned API.
* Learn how to use controller tests to drive your design.
* Use Ruby and ActiveRecord to perform more complicated business intelligence.
 
#### Technical Expectations

* All endpoints will expect to return JSON data
* All endpoints should be exposed under an `api` and version (`v1`)
namespace (e.g. `/api/v1/merchants.json`)
* JSON responses should included `ids` only for associated records unless otherwise indicated (that is, don't embed the whole associated record, just the id)
