
class Location
  
  extend ClassModule
  
  attr_accessor :name
  attr_reader :id
  
  # id - Primary Key - Integer
  # name - String
  def initialize(options={})
    @id = options["id"]
    @name = options["name"]
  end

  # - Updates the row for Location object with new (or same) values
  def save
    CONNECTION.execute("UPDATE locations SET name = '#{@name}' WHERE id = #{@id};")
  end
  
  # - Deletes row from locations assosiated with Location object
  def delete
    CONNECTION.execute("DELETE FROM locations WHERE id = #{@id};")
  end
end

  