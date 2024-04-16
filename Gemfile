source "https://rubygems.org"
git_source(:github) { |repo|"https://github.com/#{repo}.get"}

ruby "2.6.10"
gem "rails", "~> 6.0.0"
gem "pg", ">= 0.18", "< 2.0"
gem "puma", "~> 3.11"
gem "sass-rails", "~> 5"
gem "webpacker", "~> 4.0"
gem "turbolinks", "~> 5"
gem "jbuilder", "~> 2.7"

gem "bootsnap", ">= 1.4.2", require: false

gem "bcrypt"
gem "rails-i18n"
gem "kaminari"
gem "date_validator"
gem "valid_email2"
gem "nokogiri"

# 「warning: already initialized constant Net::ProtocRetryError」への対処。
gem 'net-http'

group :development, :test do
  gem "byebug", platforms: [:mri, :mingw, :x64_mingw]
end

group :development do
  gem "web-console", ">= 3.3.0"
  gem "listen", ">= 3.0.5", "< 3.2"
  gem "spring"
  gem "spring-watcher-listen", "~> 2.0.0"
  gem "spring-watcher-listen", "~> 2.0.0"
end

group :test do
  gem "capybara", ">= 2.15"
  gem "selenium-webdriver"
  gem "webdrivers"
  gem "rspec-rails"
  gem "factory_bot_rails"
end
