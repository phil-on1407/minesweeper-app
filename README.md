<img width="1296" alt="app22" src="https://github.com/phil-on1407/minesweeper-app/assets/78330800/eb4dce56-5db8-4bcf-9517-634abc5b260c"># General Information

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

## Screrenshot

<img width="1265" alt="app11" src="https://github.com/phil-on1407/minesweeper-app/assets/78330800/6780c758-f6e7-49d1-8ddf-c5fb52799b7f">

<img width="1296" alt="app22" src="https://github.com/phil-on1407/minesweeper-app/assets/78330800/7747eaf2-bd92-4438-a8f6-9197e53bb701">

<img width="1263" alt="app33" src="https://github.com/phil-on1407/minesweeper-app/assets/78330800/f76ffdd0-6d99-4af1-ad15-6f7797e92354">



