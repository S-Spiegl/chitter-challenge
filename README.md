# Chitter Challenge


## To use the deployed app, <a href="https://chitter5.herokuapp.com">click here</a>
## Local use instructions:
- Clone this repo
- Run bundler to install dependencies
- Set up your tables as follows:
  - enter ```# psql postgresql``` in the terminal:
  - You should now see something like the following:<br>
  ```psql (14.4)```<br>
  ```Type "help" for help.```
  - once in psql, enter the info found in ```db/migrations```
  - You should now have your database and test database set up
- start up the server with ```rackup```, ```$ rackup config.ru``` or ```$ rackup -p 3000```
- navigate to the relevant localhost address, either ```localhost:9292``` or ```localhost:3000```, depending on the above choice
- to view the info in the databases, navigate to the you wish to view database, then enter ```# \dt``` to view all tables.
- to view a specific table, e.g. spaces, enter ```SELECT * FROM spaces```
- to run tests, run rspec

## To do: 

- Fix timestamp (see below)
- Sort out the styling
- Prevent duplicate signups
- Deploy

##


My notes and planning can be found here: https://www.notion.so/manic-picnic-dreamworld/Chitter-5a7c5b89c6164ae2a3db219b0c28f0b7

Here are the domain models:

![Screenshot 2022-05-16 at 10 50 59](https://user-images.githubusercontent.com/98267087/168569541-f11f876c-6667-42c9-9653-bd13e5f69d86.png)

![Screenshot 2022-05-16 at 10 51 07](https://user-images.githubusercontent.com/98267087/168569581-fdb9e651-d052-4160-b43f-e02bb8f68490.png)

![Screenshot 2022-05-16 at 10 51 25](https://user-images.githubusercontent.com/98267087/168569598-fd35e801-3651-4edc-a8b5-a22fe4eba4e6.png)

=========================

- Feel free to use Google, your notes, books, etc. but work on your own
- If you refer to the solution of another coach or student, please put a link to that in your README
- If you have a partial solution, **still check in a partial solution**
- You must submit a pull request to this repo with your code by 9am Monday morning

## Challenge:

As usual please start by forking this repo.

We are going to write a small Twitter clone that will allow the users to post messages to a public stream.

## Features:

```
STRAIGHT UP

As a Maker
So that I can let people know what I am doing
I want to post a message (peep) to chitter

As a maker
So that I can see what others are saying
I want to see all peeps in reverse chronological order

As a Maker
So that I can better appreciate the context of a peep
I want to see the time at which it was made

As a Maker
So that I can post messages on Chitter as me
I want to sign up for Chitter

HARDER

As a Maker
So that only I can post messages on Chitter as me
I want to log in to Chitter

As a Maker
So that I can avoid others posting messages on Chitter as me
I want to log out of Chitter

ADVANCED

As a Maker
So that I can stay constantly tapped in to the shouty box of Chitter
I want to receive an email if I am tagged in a Peep
```

## Technical Approach:

In this unit, you integrated a database into Bookmark Manager using the `PG` gem and `SQL` queries. You can continue to use this approach when building Chitter Challenge.

If you'd like more technical challenge now, try using an [Object Relational Mapper](https://en.wikipedia.org/wiki/Object-relational_mapping) as the database interface.

Some useful resources:
**Ruby Object Mapper**

- [ROM](https://rom-rb.org/)

**ActiveRecord**

- [ActiveRecord ORM](https://guides.rubyonrails.org/active_record_basics.html)
- [Sinatra & ActiveRecord setup](https://learn.co/lessons/sinatra-activerecord-setup)

## Notes on functionality:

- You don't have to be logged in to see the peeps.
- Makers sign up to chitter with their email, password, name and a username (e.g. samm@makersacademy.com, password123, Sam Morgan, sjmog).
- The username and email are unique.
- Peeps (posts to chitter) have the name of the maker and their user handle.
- Your README should indicate the technologies used, and give instructions on how to install and run the tests.

## Bonus:

If you have time you can implement the following:

- In order to start a conversation as a maker I want to reply to a peep from another maker.

And/Or:

- Work on the CSS to make it look good.

Good luck and let the chitter begin!

## Code Review

In code review we'll be hoping to see:

- All tests passing
- High [Test coverage](https://github.com/makersacademy/course/blob/main/pills/test_coverage.md) (>95% is good)
- The code is elegant: every class has a clear responsibility, methods are short etc.

Reviewers will potentially be using this [code review rubric](docs/review.md). Referring to this rubric in advance may make the challenge somewhat easier. You should be the judge of how much challenge you want at this moment.

## Automated Tests:

Opening a pull request against this repository will will trigger Travis CI to perform a build of your application and run your full suite of RSpec tests. If any of your tests rely on a connection with your database - and they should - this is likely to cause a problem. The build of your application created by has no connection to the local database you will have created on your machine, so when your tests try to interact with it they'll be unable to do so and will fail.

If you want a green tick against your pull request you'll need to configure Travis' build process by adding the necessary steps for creating your database to the `.travis.yml` file.

- [Travis Basics](https://docs.travis-ci.com/user/tutorial/)
- [Travis - Setting up Databases](https://docs.travis-ci.com/user/database-setup/)

## Notes on test coverage

Please ensure you have the following **AT THE TOP** of your spec_helper.rb in order to have test coverage stats generated
on your pull request:

```ruby
require 'simplecov'
require 'simplecov-console'

SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter.new([
  SimpleCov::Formatter::Console,
  # Want a nice code coverage website? Uncomment this next line!
  # SimpleCov::Formatter::HTMLFormatter
])
SimpleCov.start
```

You can see your test coverage when you run your tests. If you want this in a graphical form, uncomment the `HTMLFormatter` line and see what happens!
