source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "3.0.0"

gem "blueprinter"
gem "bootsnap", require: false
gem "devise"
gem "devise-jwt"
gem "figaro"
gem "image_processing", "~> 1.2"
gem "kaminari"
gem "oj"
gem "pg", "~> 1.1"
gem "puma", "~> 5.0"
gem "rack-cors"
gem "rails", "~> 7.0.1"
gem "ransack"
gem "snaky_camel"
gem "tzinfo-data", platforms: %i[mingw mswin x64_mingw jruby]

# gem "jbuilder"
# gem "kredis"
# gem "bcrypt", "~> 3.1.7"

group :develoment do
  # gem "spring"
  gem "awesome_print"
end

group :development, :test do
  gem "annotate"
  gem "brakeman"
  gem "debug", platforms: %i[mri mingw x64_mingw]
  gem "factory_bot_rails"
  gem "fasterer"
  gem "rspec-rails"
  gem "rubocop"
  gem "rubocop-performance"
  gem "rubocop-rails"
  gem "rubocop-rspec"
  gem "shoulda-matchers"
end

group :development, :test, :staging do
  gem "faker"
end
