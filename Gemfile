source 'https://rubygems.org'

ruby '2.6.3'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

group :development, :test do
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'capybara', '~> 2.13'
  gem 'factory_bot_rails'
  gem 'rspec-rails', '~> 3.7'
  gem 'simplecov', require: false
  gem 'selenium-webdriver'
  gem 'pry-rails'
  gem 'faker'
  gem 'bullet'
  gem 'dotenv-rails'
end

gem 'rails', '~> 6.0.0'
gem 'pg'
gem 'puma', '~> 4.3'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'turbolinks', '~> 5'
gem 'jbuilder', '~> 2.5'
gem "bootstrap", ">= 4.3.1"
gem 'chartkick'
gem 'jquery-rails'
gem 'listen', '>= 3.0.5', '< 3.2'
gem 'rack-cors'
gem 'spring'
gem 'ransack'
gem 'spring-watcher-listen', '~> 2.0.0'
gem 'web-console', group: :development
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
gem 'friendly_id', '~> 5.2.4'
gem 'bcrypt'

# GraphQL
# gem 'graphql'
# gem 'graphiql-rails'
