source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end


gem 'rails', '~> 5.1.6'
gem 'pg', '>= 0.18', '< 2.0'
gem 'puma', '~> 3.7'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.2'
gem 'jbuilder', '~> 2.5'
gem 'fast_jsonapi'
gem 'faraday'
gem 'figaro'
gem 'bcrypt'


group :development, :test do
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'rspec-rails'
  gem 'pry'
  gem 'factory_bot_rails'
  gem 'capybara'
end

group :development do
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
end

group :test do
	gem 'simplecov'
	gem 'vcr'
	gem 'shoulda-matchers'
	gem 'database_cleaner'
	gem 'webmock'	
end

gem 'codecov', :require => false, :group => :test
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
