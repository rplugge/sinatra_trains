get "/add_user" do
  @page_title = "Add User"
  erb :"users/add_user_form"
end

get "/save_user" do
  new_user = User.new({"name" => params["user"]["name"]})
  
  new_user.add_to_database
  
  erb :"main/success"
end

get "/view_users" do
  @page_title = "View Users"
  erb :"users/view_users"
end

get "/edit_user" do
  @page_title = "Edit User"
  erb :"users/edit_user_list"
end

get "/edit_user/:id" do
  @page_title = "Edit User"
  erb :"users/edit_user_form"
end

get "/change_user/:id" do
  column = params["edit_choice"]
  
  user_object = User.find(params["id"].to_i)
  user_object.send("#{column}=", params["new_input"])
  user_object.save
  
  erb :"main/success"
end

get "/delete_user" do
  @page_title = "Delete User"
  erb :"users/delete_user_list"
end

get "/delete_user/:id" do
  user_object = User.find(params["id"].to_i)
  user_object.delete
  
  erb :"main/success"
end