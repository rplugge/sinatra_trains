get "/add_location" do
  @page_title = "Add Location"
  erb :"locations/add_location_form"
end

get "/save_location" do
  new_location = Location.new({"name" => params["location"]["name"]})
  
  new_location.add_to_database
  
  erb :"main/success"
end

get "/view_locations" do
  @page_title = "View Locations"
  erb :"locations/view_locations"
end

get "/edit_location" do
  @page_title = "Edit Location"
  erb :"locations/edit_location_list"
end

get "/edit_location/:id" do
  @page_title = "Edit Location"
  erb :"locations/edit_location_form"
end

get "/change_location/:id" do
  column = params["edit_choice"]
  
  location_object = Location.find(params["id"].to_i)
  location_object.send("#{column}=", params["new_input"])
  location_object.save
  
  erb :"main/success"
end

get "/delete_location" do
  @page_title = "Delete Location"
  erb :"locations/delete_location_list"
end

get "/delete_location/:id" do
  location_object = Location.find(params["id"].to_i)
  location_object.delete
  
  erb :"main/success"
end