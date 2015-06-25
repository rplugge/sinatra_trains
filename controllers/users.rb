get "/add_user" do
  erb :"users/add_user_form"
end

get "/save_user" do
  new_user = User.new({"name" => params["user"]["name"]})
  
  new_user.add_to_database
  
  erb :"main/success"
end

get "/view_users" do
  erb :"users/view_users"
end

get "/edit_user" do
  erb :"users/edit_user_list"
end

get "/edit_user/:id" do
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
  erb :"users/delete_user_list"
end

get "/delete_user/:id" do
  user_object = User.find(params["id"].to_i)
  user_object.delete
  
  erb :"main/success"
end