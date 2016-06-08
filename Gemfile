source 'https://rubygems.org'

ruby '2.2.4'

gem 'activerecord'

# Import from spreadsheets
gem 'roo', '2.1.1'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.2.1'
# Use SCSS for stylesheets
gem 'sass-rails', '5.0.3'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '2.7.1'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '4.1.0'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails', '4.0.3'
# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks', '2.5.3'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '2.2.13'
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '0.4.1', group: :doc

#Using the bootstrap framework for styling
gem 'bootstrap-sass', '3.3.4.1'

# Use ActiveModel has_secure_password
gem 'bcrypt', '~> 3.1.7'

gem 'will_paginate', '3.0.7'
gem 'bootstrap-will_paginate', '0.0.10'

gem 'geocoder', '1.2.8'

gem 'carrierwave', '0.10.0'
gem 'fog'
gem 'mini_magick'

gem 'figaro'

gem 'tinymce-rails'

gem 'acts-as-taggable-on', '~> 3.4'

# Fake names and emails
gem 'faker', '1.6.3'

gem 'omniauth-twitter'
gem 'omniauth-facebook'

# Use Unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

group :development, :test do

  # Use sqlite3 as the database for Active Record
  gem 'sqlite3', '1.3.10'

  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', '4.0.5'

  # Access an IRB console on exception pages or by using <%= console %> in views
  gem 'web-console', '2.1.2'

  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring', '1.3.6'

end

group :test do
  gem 'guard', '2.12.5'
  gem 'minitest-reporters', '1.0.14'
  gem 'mini_backtrace',     '0.1.3'
  gem 'guard-minitest',     '2.4.4'
end

group :production do
    gem 'pg', '0.18.1'
    gem 'rails_12factor'
    gem 'puma', '2.11.2'
end
