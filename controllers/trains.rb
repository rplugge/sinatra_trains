get "/add_train" do
  erb ":trains/add_train_form"
end

get "/save_train" do
  new_train = Train.new({"name" => params["name"], "location_id" => params["location_id"]})
  
  new_train.add({"name" => params["name"], "location_id" => params["location_id"]})
  
  erb :"homepage"
end