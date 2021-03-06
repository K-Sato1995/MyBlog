require 'spec_helper'
ENV['RAILS_ENV'] ||= 'test'

if ENV['RAILS_ENV'] == 'test'
  require 'simplecov'
  SimpleCov.start do
    add_group 'Models', 'app/models/'
    add_group 'Helpers', 'app/helpers/'
    add_group 'API', 'app/controllers/api/v1'
    add_group 'Mailers', '/mailers/'

    add_filter '/channels/'
    add_filter '/jobs/'
    add_filter '/controllers/admin'
    add_filter '/controllers/application_controller.rb'
    add_filter '/config/'
    add_filter '/spec/'
  end
end

require File.expand_path('../../config/environment', __FILE__)

abort('The Rails environment is running in production mode!') if Rails.env.production?

require 'rspec/rails'

begin
  ActiveRecord::Migration.maintain_test_schema!
rescue ActiveRecord::PendingMigrationError => e
  puts e.to_s.strip
  exit 1
end

RSpec.configure do |config|
  config.include FactoryBot::Syntax::Methods
  config.fixture_path = "#{::Rails.root}/spec/fixtures"
  config.use_transactional_fixtures = true
  config.infer_spec_type_from_file_location!
  config.filter_rails_from_backtrace!
end
