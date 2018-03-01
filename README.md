# Don't Forget

Don't forget, is a todo list app to organize life

## Installation

* Change file name config/database.yml to config/database_prod.yml

* Change file name config/database_dev.yml to config/database.yml

* Run ```rails db:create db:migrate``` to create a database and run all migrations.

* Run ```bundle install``` to install all gems.

* Run ```rails s``` to start the application.

* The app should be available on http://localhost:3000

For production don't forget run ```bundle exec rake assets:precompile```

## Tests

The capybara and rspec gems are used for testing. The following command should run them.

```
rspec
```
