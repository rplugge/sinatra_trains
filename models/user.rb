
class User
  
  include InstanceModule
  extend ClassModule
  
  attr_accessor :name, :title
  attr_reader :id
  
  # id - Primary Key - Integer
  # name - String
  # title - The title of the person (is based on how many trains have been ridden) - STRING
  #
  # If the User object has an id then it runs the method .find_title on the object.
  def initialize(options={})
    @id = options["id"]
    @name = options["name"]
    @title = options["title"]
    
    if @id != nil
      self.find_title
    end
  end

  # - Updates the row for User object with new (or same) values
  def save
    CONNECTION.execute("UPDATE users SET name = '#{@name}' WHERE id = #{@id};")
  end
  
  # - Deletes row from trains assosiated with Train object
  def delete
    CONNECTION.execute("DELETE FROM users WHERE id = #{@id};")
  end
  
  # - Adds values for the object into a new row in the database
  def add_to_database
    CONNECTION.execute("INSERT INTO users (name) VALUES ('#{@name}');")
    @id = CONNECTION.last_insert_row_id
  end
  
  # - Retrieves all the trains a user has ridden and puts each train name in an array. 
  # - Runs .length on the array to determine the number of trains ridden (trians_ridden)
  # - Updates @title with the new 'title' based on number of trains ridden
  def find_title
    result = CONNECTION.execute("SELECT trains.name FROM logs JOIN trains ON logs.train_id = trains.id WHERE logs.user_id = #{@id}")
    
    new_array = []
    
    #new_array = result.name_loop
    result.each do |item|
      new_array << item["name"]
    end
    
    trains_ridden = new_array.length
    
    if trains_ridden >= 0 && trains_ridden <= 5
      @title = "Newbie"
    elsif trains_ridden >= 5 && trains_ridden <= 20
      @title = "Train Enthusiast"
    elsif trains_ridden > 20
      @title = "Lord of the Trains"
    end
    
    return self
  end
end

  