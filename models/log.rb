
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
  
  # - Adds values for the object into a new row in the database if the entry is unique
  #
  # - Returns false if the object was not unique
  def add_to_database
    if self.unique?
      CONNECTION.execute("INSERT INTO logs (user_id, train_id) VALUES (#{@user_id}, #{@train_id});")
      @id = CONNECTION.last_insert_row_id
      
      return self
    end
  end
  
  # - Checks to see if a log entry with the same user_id and train_id exists.
  #
  # - Returns true if no records are returned.
  def unique?
    existing_record = CONNECTION.execute("SELECT * FROM logs WHERE user_id = #{@user_id} AND train_id = #{@train_id}")
    return existing_record == []
  end
  
  # - Retrieves all the names of trains that a user has ridden.
  #
  # - this_id = The User id - INTEGER
  #
  # - Returns an array of train names
  def self.logs_for_user(this_id)
    result = CONNECTION.execute("SELECT trains.name FROM logs JOIN trains ON logs.train_id = trains.id WHERE logs.user_id = #{this_id}")
    
    log_array = []
    
    result.each do |result|
      log_array << result["name"]
    end
    
    return log_array
  end
end

  