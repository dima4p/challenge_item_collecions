source 'https://rubygems.org'

ruby '2.2.2'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.2.1'
# Use sqlite3 as the database for Active Record
gem 'sqlite3'

# assets
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.1.0'
# See https://github.com/rails/execjs#readme for more supported runtimes
gem 'therubyracer', platforms: :ruby
# Use jquery as the JavaScript library
gem 'jquery-rails'
# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
# gem 'turbolinks'
gem 'compass-rails'
gem 'fancy-buttons'

# docs
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0', group: :doc

# auth
gem 'authlogic'
gem 'cancancan', github: 'dima4p/cancancan', branch: 'develop'

# views
gem 'haml-rails'
gem 'jbuilder', '~> 2.0'
gem 'simple_form'

# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

group :development do
  # Installs gems for notification but does not incudes them to Gemfile.lock.
  # NOTE: run `bundle install` twice in order not to have the following gems in lock
  if (Gem::Specification.map(&:name) & %w[rb-fchange rb-inotify rb-fsevent]).empty?
    if RUBY_PLATFORM =~ /win32/
      gem 'rb-fchange'
      gem 'rb-notifu'
    elsif RUBY_PLATFORM =~ /linux/
      gem 'rb-inotify'
      gem 'libnotify'
    elsif RUBY_PLATFORM =~ /darwin/
      gem 'rb-fsevent'
      gem 'growl'
    end
  end

  gem 'annotate'
  gem 'quiet_assets'

  # i18n + templates and tools
  gem 'active_record_model_and_rspec_enhanced_templates'
  gem 'advanced_haml_scaffold_generator'
  gem 'factory_girl_fixtures_template'
  gem 'i18n_scaffold_controller_template'
  gem 'i18n_scaffold_generator'
  gem 'jbuilder_rspec_generator'
  gem 'rspec_rails_scaffold_templates'
end

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug'

  # Access an IRB console on exception pages or by using <%= console %> in views
  gem 'web-console', '~> 2.0'

  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'

  # To load the directory
  gem 'require_all'

  # Guard, spec, and other
  gem 'guard'
  gem 'guard-rspec'
  gem 'listen'
  gem 'rspec-activemodel-mocks'
  gem 'rspec-rails'
end

group :test do
  gem 'capybara'
  gem 'poltergeist'
  gem 'factory_girl_rails', github: 'dima4p/factory_girl_rails'
  gem 'shoulda'
  gem 'email_spec'
end
