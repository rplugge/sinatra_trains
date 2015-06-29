
class Train
  
  include InstanceModule
  extend ClassModule
  
  attr_accessor :name, :location_id
  attr_reader :id
  
  # id - Primary Key - Integer
  # name - String
  # location_id - Foreign Key (locations) - Integer
  def initialize(options={})
    @id = options["id"]
    @name = options["name"]
    @location_id = options["location_id"]
  end

  # - Updates the row for Train object with new (or same) values
  def save
    CONNECTION.execute("UPDATE trains SET name = '#{self.name}', location_id = #{self.location_id} WHERE id = #{self.id};")
  end
  
  # - Deletes row from trains assosiated with Train object
  def delete
    CONNECTION.execute("DELETE FROM trains WHERE id = #{self.id};")
  end
  
  # - Adds values for the object into a new row in the database
  def add_to_database
    CONNECTION.execute("INSERT INTO trains (name, location_id) VALUES ('#{self.name}', #{self.location_id});")
    @id = CONNECTION.last_insert_row_id
  end
end

  