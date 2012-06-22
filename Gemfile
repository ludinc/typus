source 'http://rubygems.org'

# Declare your gem's dependencies in typus.gemspec.
# Bundler will treat runtime dependencies like base dependencies, and
# development dependencies will be added by default to the :development group.
gemspec

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'

  # See https://github.com/sstephenson/execjs#readme for more supported runtimes
  # gem 'therubyracer', :platforms => :ruby

  gem 'uglifier', '>= 1.0.3'
end

gem 'thin'

# Database adapters
platforms :jruby do
  gem 'activerecord-jdbcmysql-adapter'
  gem 'activerecord-jdbcpostgresql-adapter'
  gem 'activerecord-jdbcsqlite3-adapter'

  gem 'jruby-openssl' # JRuby limited openssl loaded. http://jruby.org/openssl
end

platforms :ruby do
  gem 'mysql2', '~> 0.3.11'
  gem 'pg', '~> 0.13.2'
  gem 'sqlite3', '~> 1.3.5'
end

# Typus can manage lists, trees, trashes, so we want to enable this stuff
# on the demo.
gem 'acts_as_list'
gem 'acts_as_tree'
gem 'rails-permalink', '~> 1.0.0'
gem 'rails-trash', '~> 2.0.0'

# We want to be able to use Factory Girl for seeding data.
gem 'factory_girl_rails', '~> 1.7.0'

# For some reason I also need to define the `jquery-rails` gem here.
gem 'jquery-rails'

# Rich Text Editor
gem 'ckeditor-rails', '~> 0.0.3'

# Alternative authentication
gem 'devise', '~> 2.0.4'

# Asset Management with Dragonfly
gem 'dragonfly', '~> 0.9.10'
gem 'rack-cache', :require => 'rack/cache'

# Asset Management with Paperclip
gem 'paperclip', '~> 2.7.0'

# MongoDB
gem 'mongoid', '~> 2.4.6'
gem 'bson_ext', '~> 1.6.1'

group :test do
  gem 'shoulda-context', '~> 1.0.0'
  gem 'mocha' # Make sure mocha is loaded at the end ...
end

gem 'kaminari'
# gem 'will_paginate'
