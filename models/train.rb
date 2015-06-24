
class Train
  
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
    CONNECTION.execute("UPDATE trains SET name = '#{@name}', location_id = #{@location_id} WHERE id = #{@id};")
  end
  
  # - Deletes row from trains assosiated with Train object
  def delete
    CONNECTION.execute("DELETE FROM trains WHERE id = #{@id};")
  end
end

  