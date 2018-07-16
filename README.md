# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version
	2.5.1

* System dependencies
	$ bundle install 

* Configuration

* Database creation
	$ rails db:create:all

* Database initialization
	$ rails db:migrate 
	$ rails db:migrate RAILS_ENV=test				 # test environment
	$ rails db:migrate RAILS_ENV=production  # production environment

* How to run the test suite
	$ rspec 
	$ rspec spec/controllers/
	$ rspec spec/model/

	use -fd to formar documentation, example: 
	$ rspec -fd spec

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions
	$ heroku login
	$ heroku create app_name
	# add remote origin to heroku
	$ git push heroku master

	see remote addeds
	$ git remote -v

* ...
