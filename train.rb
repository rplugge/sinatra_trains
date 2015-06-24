require "sqlite3"
require "active_support"
require "active_support/inflector"

CONNECTION = SQLite3::Database.new("railfan.db")

CONNECTION.execute("CREATE TABLE IF NOT EXISTS trains (id INTEGER PRIMARY KEY, name TEXT NOT NULL, location_id INTEGER NOT NULL, FOREIGN KEY(location_id) REFERENCES locations(id));")

CONNECTION.results_as_hash = true

class Train
  
  attr_accessor :name, :location_id
  
  def initialize(options={})
    @id = options["id"]
    @name = options["name"]
    @location_id = options["location_id"]
  end
  
  def self.add(options={})
    
    table_name = self.to_s.pluralize.underscore
    
    column_names = options.keys
    values = options.values
    
    column_names = column_names.join(", ")
    
    converted_values = []
    
    values.each do |value|
      if value.is_a?(String)
        converted_values << "'#{value}'"
      else
        converted_values << value
      end
    end
    
    converted_values = converted_values.join(", ")
    
    CONNECTION.execute("INSERT INTO #{table_name} (#{column_names}) VALUES (#{converted_values});")
    
    id = CONNECTION.last_insert_row_id
    options["id"] = id
    
    self.new(options)
  end
  
  def self.find(id)
    table_name = self.to_s.pluralize.underscore
    
    result = CONNECTION.execute("SELECT * FROM '#{table_name}' WHERE id = #{id};")
    result = result.first
    
    self.new(result)
  end
  
  def save
    CONNECTION.execute("UPDATE trains SET name = '#{@name}', location_id = #{@location_id} WHERE id = #{@id};")
  end
  
  def delete
    CONNECTION.execute("DELETE FROM trains WHERE id = #{@id};")
  end
end

  