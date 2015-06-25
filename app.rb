require "pry"
require "sinatra"
require "sinatra/reloader"

require "sqlite3"

require_relative "database_setup.rb"

require_relative "class_methods.rb"


# Models
require_relative "models/train.rb"
require_relative "models/location.rb"
require_relative "models/user.rb"
require_relative "models/log.rb"

# Controllers
require_relative "controllers/main.rb"
require_relative "controllers/trains.rb"
require_relative "controllers/locations.rb"
require_relative "controllers/users.rb"
require_relative "controllers/logs.rb"
