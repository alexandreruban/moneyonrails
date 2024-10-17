source "https://rubygems.org"

gem "rails", "~> 8.0.0.beta1"
gem "puma", ">= 5.0"

gem "sqlite3", ">= 2.1"

gem "solid_cache"
gem "solid_queue"
gem "solid_cable"

gem "propshaft"
gem "importmap-rails"
gem "turbo-rails"
gem "stimulus-rails"

gem "bcrypt", "~> 3.1.7"

gem "kamal", ">= 2.0.0.rc2", require: false
gem "thruster", require: false

gem "bootsnap", require: false
gem "tzinfo-data", platforms: %i[ windows jruby ]

group :development, :test do
  gem "debug", platforms: %i[ mri windows ], require: "debug/prelude"
  gem "brakeman", require: false
  gem "rubocop-rails-omakase", require: false
end

group :development do
  gem "web-console"
end
