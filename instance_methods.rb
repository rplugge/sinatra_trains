module InstanceModule
  
  require "active_support"
  require "active_support/inflector"
  
  def name_loop
    new_array = []
  
    self.each do |item|
      new_array << item["name"]
    end
  
    return new_array
  end
  
  # - Adds values for the object into a new row in the database
  def add_to_database
    CONNECTION.execute("INSERT INTO trains (name, location_id) VALUES ('#{self.name}', #{self.location_id});")
    @id = CONNECTION.last_insert_row_id
  end
  
end