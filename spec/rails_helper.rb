require 'spec_helper'
ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)

abort("The Rails environment is running in production mode!") if Rails.env.production?
require 'rspec/rails'
require 'support/factory_bot'
require 'webmock/rspec'
require 'vcr'
require 'simplecov'

VCR.configure do |config|
  config.cassette_library_dir = 'fixtures/vcr_cassettes'
  config.hook_into :webmock
  allow_http_connections_when_no_cassette = true
  config.filter_sensitive_data('<YOUR GOOGLE API KEY HERE>') { ENV['GOOGLE_API_KEY'] }
  config.filter_sensitive_data('<YOUR DARK SKY API KEY HERE>') { ENV['DARK_SKY_API_KEY'] }
  config.filter_sensitive_data('<YOUR FLICKR API KEY HERE>') { ENV['FLICKR_API_KEY'] }
end

SimpleCov.start

begin
  ActiveRecord::Migration.maintain_test_schema!
rescue ActiveRecord::PendingMigrationError => e
  puts e.to_s.strip
  exit 1
end
RSpec.configure do |config|
  config.fixture_path = "#{::Rails.root}/spec/fixtures"
  config.use_transactional_fixtures = true
  config.infer_spec_type_from_file_location!

  config.filter_rails_from_backtrace!
end

Shoulda::Matchers.configure do |config|
  config.integrate do |with|
    with.test_framework :rspec
    with.library :rails
  end
end

DatabaseCleaner.strategy = :truncation
RSpec.configure do |config|
  config.fixture_path = "#{::Rails.root}/spec/fixtures"

  config.before(:all) do
    DatabaseCleaner.clean
  end

  config.after(:each) do
    DatabaseCleaner.clean
  end
end
