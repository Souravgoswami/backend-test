
# Please do NOT open any pull requests to this repository!

## Welcome to Jalappeno backend Interview!
Place where we examine our candidates

[For recruiters](#for-recruiters)

## For candidates
### :hammer: Setup

Before pairing:
 - Clone repo `git clone git@github.com:Jalappepno-apps/backend-test.git`
 - run `bundle install` within app directory
 - run `yarn install` within app directory to install required node modules
 - run `rake db:setup` This will create database, run migrations and fill db with seeds
 - run `rails s` :boom:

## Pre-interview tasks

- You don't have to do any tasks that you weren't asked to solve
- Do not fork the repository - clone it
- Do not forget to write tests for your solutions
- Do not remove contents of this README
- Put solutions for tasks in separate pull requests with descriptive commits, merge them to master branch after all
- Do not forget to check if all tests pass by running command `RAILS_ENV=test bundle exec rspec` from you app folder

### Task 1 - updating views
We would like the navbar to be dynamic and allow users to log out when they are logged in and login/register when they aren't. [Devise gem](https://github.com/heartcombo/devise) is being used to manage user authentication, ensure sign in and sign up buttons dissapear and is replaced by user's email and logout button on navbar when user is logged in, and sign up, sign in buttons show when a user isn't logged in.

### Task 2 - consume api
We would like to have more information about a makeup on the index page. The information should come from Makeup api (e.g. http://makeup-api.herokuapp.com/). Display rating, price and other colors if available, specifications for the card component in view can be found [here](https://bulma.io/documentation/components/card/).

### Task 3 - api to local
We don't store any data in database, it is fetched directly from the API, we would like to have this data locally so, it is not fetched from an external API everytime. Write a rails seed that seeds the database intially with information from the api, fetch all the products from http://makeup-api.herokuapp.com/api/v1/products.json and store them in the database, then update the `makeups_controller.rb` and `makeups/index.slim` so makeups are now fetched from the database. 

Note: Create a migration on the database to store a new column if it doesn't exist already

### Task 4 - description validations
We would like to clean the descriptions before saving them to the database.
Makeup descriptions may contain unwanted tokens like `\n` or `\t`. Write a [callback](https://guides.rubyonrails.org/active_record_callbacks.html) that ensures these are removed before being added to the database.

### To contribute fixes/updates
* Fork repository
* Create pull request (from forked repository, not Jalappeno backend itself)
* Ask for review one of the contributors
* After PR is merged branch will be automatically propagated to public repo for candidates

### To add new tasks (please do!)
* Add task description in this README
* Create example solution on a branch with `solution` in branch name (eg. `solution-task-7-description`) - it won't be propagated to public repo this way
* You can create specific setup for your task (eg. some prepared bug, configured tool to be used)
  * Create new branch with this setup - it will be propagated to public repo
  * Push branch to [Jalappeno backend](https://github.com/Jalappeno-apps/backend-test). It will be propagated to public repo
  * Specify in this task description that it should be solved on this branch
* If you change something in the repo please try to update ruby/rails/gems versions to the latest.
