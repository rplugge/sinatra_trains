get "/add_train" do
  @page_title = "Add Train"
  erb :"trains/add_train_form"
end

get "/save_train" do
  new_train = Train.new({"name" => params["train"]["name"], "location_id" => params["train"]["location_id"]})
  
  new_train.add_to_database
  
  erb :"main/success"
end

get "/view_trains" do
  @page_title = "View Trains"
  erb :"trains/view_trains"
end

get "/edit_train" do
  @page_title = "Edit Train"
  erb :"trains/edit_train_list"
end

get "/edit_train/:id" do
  @page_title = "Edit Train"
  erb :"trains/edit_train_form"
end

get "/change_train/:id" do
  column = params["edit_choice"]
  
  train_object = Train.find(params["id"].to_i)

  train_object.send("#{column}=", params["new_input"])
  train_object.save
  
  erb :"main/success"
end

get "/delete_train" do
  @page_title = "Delete Train"
  erb :"trains/delete_train_list"
end

get "/delete_train/:id" do
  @page_title = "Delete Train"
  train_object = Train.find(params["id"].to_i)
  train_object.delete
  
  erb :"main/success"
end