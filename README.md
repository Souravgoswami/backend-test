
# Please do NOT open any pull requests to this repository!

## Welcome to Jalappeno backend Interview!
Place where we examine our candidates

[For recruiters](#for-recruiters)

## For candidates
### :hammer: Setup

Before pairing:
 - Clone repo `git clone git@github.com:Jalappepno-apps/backend-test.git`
 - run `bundle install` within app directory
 - run `rake db:setup` This will create database, run migrations and fill db with seeds
 - run `rails s` :boom:

## Pre-interview tasks

- You don't have to do any tasks that you weren't asked to solve
- Do not fork the repository - clone it
- Do not forget to write tests for your solutions
- Do not remove contents of this README
- Put solutions for tasks in separate pull requests with descriptive commits, merge them to master branch after all
- Do not forget to check if all tests pass by running command `RAILS_ENV=test bundle exec rspec` from you app folder

### Task 1 - consume api
We would like to have more information about a makeup on the index page. The information should come from Makeup api (e.g. http://makeup-api.herokuapp.com/). We should display makeup poster (e.g. https://d3t32hsnjxo7q6.cloudfront.net/i/991799d3e70b8856686979f8ff6dcfe0_ra,w158,h184_pa,w158,h184.png), rating and plot overview. We can't store this data in database.

### Task 4 - brackets validation
Our moderators are adding parentheses and brackets to the titles of makeup.

For example `The Fellowship of the Ring [Lord of The Rings {Peter Jackson}] (2012)`.

This is ok, but we need to make sure that all brackets are closed and not empty. They can be nested as in the example above.

Uncomment tests in `spec/validators/title_brackets_validator_spec.rb` and add validations for movie title that match all the criteria.
With all those tests passing you will know that solution is correct.

Hint: It can't be solved via regular expressions.

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


