
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
    CONNECTION.execute("INSERT INTO logs (user_id, train_id) VALUES (#{@user_id}, #{@train_id});")
  end
  
  
  def self.logs_for_user(this_id)
    result = CONNECTION.execute("SELECT trains.name FROM logs JOIN trains ON logs.train_id = trains.id WHERE logs.user_id = #{this_id}")
    
    log_array = []
    
    result.each do |result|
      log_array << result["name"]
    end
    
    return log_array
  end
end

  