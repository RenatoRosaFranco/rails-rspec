# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version<br/>
	2.5.1<br/>

* System dependencies</br>
	$ bundle install <br/>

* Configuration

* Database creation<br/>
	$ rails db:create:all<br/>

* Database initialization<br/>
	$ rails db:migrate<br/>
	$ rails db:migrate RAILS_ENV=test				 # test environment<br/>
	$ rails db:migrate RAILS_ENV=production  # production environment<br/>

* How to run the test suite<br/>
	$ rspec <br/>
	$ rspec spec/controllers/<br/>
	$ rspec spec/model/<br/>

	use -fd to format documentation, example:<br/>	 
	$ rspec -fd spec<br/>

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions<br/>
	$ heroku login<br/>
	$ heroku create app_name<br/></br>
	add remote origin to heroku<br/>
	$ git push heroku master<br/>

	see remote addeds<br/>
	$ git remote -v<br/>

* ...
