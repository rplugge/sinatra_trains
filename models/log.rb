
class Log
  
  extend ClassModule
  
  attr_accessor :user_id, :train_id 
  attr_reader :id
  
  # id - Primary Key - Integer
  # user_id - INTEGER - The ID of the user who rode a train
  # train_id - INTEGER - The ID of the train the user rode
  def initialize(options={})
    @id = options["id"]
    @user_id = options["user_id"]
    @train_id = options["train_id"]
  end

  # - Updates the row for Log object with new (or same) values
  def save
    @user_id = @user_id.to_i
    @train_id = @train_id.to_i
    CONNECTION.execute("UPDATE logs SET user_id = '#{@user_id}', train_id = '#{@train_id} WHERE id = #{@id};")
  end
  
  # - Deletes row from logs assosiated with Log object
  def delete
    CONNECTION.execute("DELETE FROM logs WHERE id = #{@id};")
  end
  
  # - Adds values for the object into a new row in the database
  def add_to_database
    CONNECTION.execute("INSERT INTO logs (user_id, train_id) VALUES (@user_id, @train_id);")
  end
  
  # - First runs some SQL returning the names of all trains with an ID == the train_id in the Log table for that user
  #
  # - Runs a loop on the first array removing the extra information and inserting it into a new "cleaner" array.
  #
  # - Returns the "clean" array.
  def where_id
    messy_train_array = CONNECTION.execute("SELECT name FROM trains WHERE id = #{@train_id}")
    
    train_array = []
  
    messy_train_array.each do |a|
      train_array << a["name"]
    end
    
    return train_array
  end
  
end

  