
class User
  
  extend ClassModule
  
  attr_accessor :name, :title
  attr_reader :id
  
  # id - Primary Key - Integer
  # name - String
  # title - The title of the person (is based on how many trains have been ridden) - STRING
  def initialize(options={})
    @id = options["id"]
    @name = options["name"]
    @title = options["title"]
  end

  # - Updates the row for User object with new (or same) values
  def save
    CONNECTION.execute("UPDATE users SET name = '#{@name}' WHERE id = #{@id};")
  end
  
  # - Deletes row from trains assosiated with Train object
  def delete
    CONNECTION.execute("DELETE FROM users WHERE id = #{@id};")
  end
end

  