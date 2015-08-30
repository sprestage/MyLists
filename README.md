My Lists
=======

This is a web site for all of my lists, such as Grocery, Ranch To Do, Housework To Do, Personal To Do, Professional To Do, etc.

[![Dependency Status](https://gemnasium.com/sprestage/MyLists.svg)](https://gemnasium.com/sprestage/MyLists)
[![Code Climate](https://codeclimate.com/github/sprestage/MyLists.png)](https://codeclimate.com/github/sprestage/MyLists)

Currently running Rails 4.0

Basic Install
=======
Clone this git repository.
  > clone http://github.com/sprestage/MyLists.git

Run the rails server
  > rails s

Use browser to access your lists at http://localhost:3000


Current Issues
=======
Tests run successfully, 6 passes, 4 errors.  This needs some work.


Implementation
=======
This is a simple rails app, with a pair of nested resources, Lists and Items.  Each list has many items.  Each item belongs to one list.

  > rails \_3.2.15\_ new MyLists --skip-test-unit

  > cd MyLists

Edit Gemfile for some useful debugging gems

  > bundle

Tuck away RAILS_SECRET from /config/initializer/secret_token.rb to /config/application.yml and add /config/application.yml to .gitignore.

Ok, now we create the scaffold for the new resource, List.

  > rails g scaffold list -f --no-test-framework --no-assets --no-stylesheets --no-scss name:string

Somehow, the above doesn't successfully create the name column, so I generated an additional migration to add the list name.

  > rails g migration AddListNameToLists list_name:string

  > rake db:migrate

Alternately, I should probably create all the tests first, but I feel so lost without the stuff there first, ya know.

Create the tests, starting with show index of lists, show single list, and create list.  I played with this to create the files,
then I completely replaced what was in the files.
  > rails g mini_test:feature ListShowIndex

  > rails g mini_test:feature ListShow

  > rails g mini_test:feature ListCreate

I really like the lists controller that the scaffold command created earlier.

Ok, now time to run the tests.  Oooops, gotta run the database migration first.

  > rake db:migrate

Hmmm, not sure what's wrong.  Let's fire up the server and see what we can learn.

  > rails s

Starts up ok.  Browse to localhost:3000.  Aha, forgot to add the root route 'root :to => 'home#index' to /config/routes.rb

Ok, what next.  Keep browsing.  Ahhhh.  Home controller is missing.  Ok, create a /app/controllers/home_controller.rb.  Add
a stub for index:

	class HomeController < ApplicationController
	  def index
	  end
	end

All the browsing seems in order now.  Time to get the tests running.

Don't forget to add fixture support to the /test/minitest_helper.rb file!

Ok, got the first three tests working.  Time for the last two.
  > rails g mini_test:feature ListUpdate

  > rails g mini_test:feature ListDelete

Ok, all List stuff works.  Time to implement items:

  > rails g scaffold item --no-test-framework --no-assets --no-stylesheets --no-scss name:string

  > rails g mini_test:feature ItemShowIndex

  > rails g mini_test:feature ItemShow

  > rails g mini_test:feature ItemCreate

Add Items to the DB:
  > rake db:migrate

Add name column to Items in DB:
  > rails g migration AddNameToItems name:string

  > rake db:migrate

Add Item name to display on /items/new page

Edit all the 5 /views/items/*.html.erb to display the fields from the models.

All green!  Add the final 2 tests
  > rails g mini_test:feature ItemUpdate

  > rails g mini_test:feature ItemDelete

Ok, done for now.  Time to start implementing the nested resources.  Woot!

  > rails generate migration AddListIdToItems list_id:integer

Check the migration file, then
  > rake db:migrate

  > rake db:test:prepare

Best ever nested resource code examples: http://blog.8thcolor.com/2011/08/nested-resources-with-independent-views-in-ruby-on-rails/

Whew!  So much tweaking of the Items controller, the views (of the Items and of Show Lists), and the Item tests.  Getting
these paths correct was brutal.  I'm glad I've got it done and locked down in github for reference.


