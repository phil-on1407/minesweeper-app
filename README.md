# General Information

* Ruby version: 3.3.0
* Rails version: 7.1.2
* PostgreSQL

# Installation

- Make sure that you have installed ruby, rails and postgresql

- Install correct ruby version for our project: rbenv local 3.3.0

- Install bundler: `gem install bundler`

- Install gems: `bundle install`

- Create database `rails db:create`

- Migrate database `rails db:migrate`

- Run `rails db:seed`

- Run `rails server`

Visit `http://localhost:3000` and start your development

# Rspec
- To run unit tests, run `bundle exec rspec` in the terminal
- After running your tests, open `coverage/index.html` in the browser of your choice.

# Deployment to Heroku
- Step 1: Create Procfile: Add `release: bin/rails db:migrate` and `web: bin/rails server -p ${PORT:-5000} -e $RAILS_ENV`
- Step 2: Create, setup a new app
- Step 3: `git push heroku main` to release latest version to heroku.
