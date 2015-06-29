module ClassModule
  
  require "active_support"
  require "active_support/inflector"
  
  def table_name
    self.to_s.pluralize.underscore
  end

  # - Class Method - Gathers all information from the table that is assosiated with the class this is being called on.
  #
  # - Creates new objects for all selected rows and puts them into an array.
  #
  # - Returns the array with objects inside.
  def all
    table_name = self.table_name
    
    results = CONNECTION.execute("SELECT * FROM '#{table_name}';")

    results_as_objects = []
    
    results.each do |result_hash|
      results_as_objects << self.new(result_hash)
    end
    
    return results_as_objects
  end

  # - Retrieves information from a table with the row id == to arguement id
  #
  # - id - INTEGER - The Primary Key for a row in a table. 
  #
  # - Returns object
  def find(id)
    table_name = self.table_name
    
    result = CONNECTION.execute("SELECT * FROM '#{table_name}' WHERE id = #{id};")
    result = result.first
    
    self.new(result)
  end
end
  
  
  
##  -  Unused Class Method - Replaced by instance methods
#
#     -----------------------------------------------------  
#   # - Adds a new row into a table with the values taken in the arguement.
#   # - Seperates values and keys, puts them into arrays to be put into SQL.
#   #
#   # - options - Hash - contains the information to insert into a table
#   #
#   # - Returns an object
#   def add(options={})
#
#     table_name = self.to_s.pluralize.underscore
#
#     column_names = options.keys
#     values = options.values
#
#     column_names = column_names.join(", ")
#
#     converted_values = []
#
#     values.each do |value|
#       if value.is_a?(String)
#         converted_values << "'#{value}'"
#       else
#         converted_values << value
#       end
#     end
#
#     converted_values = converted_values.join(", ")
#
#     CONNECTION.execute("INSERT INTO #{table_name} (#{column_names}) VALUES (#{converted_values});")
#
#     id = CONNECTION.last_insert_row_id
#     options["id"] = id
#
#     self.new(options)
#   end
# end