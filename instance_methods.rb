module InstanceModule
  
  require "active_support"
  require "active_support/inflector"
  
  def self.name_loop
    new_array = []
  
    self.each do |item|
      new_array << item["name"]
    end
  
    return new_array
  end
  
end