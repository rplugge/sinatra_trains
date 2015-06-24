require "sqlite3"
require "active_support"
require "active_support/inflector"

require_relative "class_methods"

CONNECTION = SQLite3::Database.new("railfan.db")

CONNECTION.execute("CREATE TABLE IF NOT EXISTS trains (id INTEGER PRIMARY KEY, name TEXT NOT NULL, location_id INTEGER NOT NULL, FOREIGN KEY(location_id) REFERENCES locations(id));")

CONNECTION.results_as_hash = true

class Train
  
  attr_accessor :name, :location_id
  
  # id - Primary Key - Integer
  # name - String
  # location_id - Foreign Key (locations) - Integer
  def initialize(options={})
    @id = options["id"]
    @name = options["name"]
    @location_id = options["location_id"]
  end

  def save
    CONNECTION.execute("UPDATE trains SET name = '#{@name}', location_id = #{@location_id} WHERE id = #{@id};")
  end
  
  def delete
    CONNECTION.execute("DELETE FROM trains WHERE id = #{@id};")
  end
end

  