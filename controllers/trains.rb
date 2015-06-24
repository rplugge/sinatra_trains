get "/add_train" do
  erb :"trains/add_train_form"
end

get "/save_train" do
  new_train = Train.new({"name" => params["name"], "location_id" => params["location_id"]})
  
  Train.add({"name" => params["name"], "location_id" => params["location_id"]})
  
  erb :"main/success"
end

get "/view_trains" do
  erb :"trains/view_trains"
end

get "/edit_train" do
  erb :"trains/edit_train_list"
end

get "/edit_train/:id" do
  erb :"trains/edit_train_form"
end

get "/change_train/:id" do
  column = params["edit_choice"]
  
  train_object = Train.find(params["id"].to_i)
  train_object.send("#{column}=", params["new_input"])
  train_object.save
  
  erb :"main/success"
end