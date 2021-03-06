get "/add_log" do
  @page_title = "Add Log"
  erb :"logs/add_log_form"
end

get "/save_log" do
  new_log = Log.new({"user_id" => params["log"]["user_id"], "train_id" => params["log"]["train_id"]})
  
  if new_log.add_to_database
    erb :"main/success"
  else
    erb :"main/log_failure"
  end
end

get "/view_logs" do
  @page_title = "View Logs"
  erb :"logs/view_logs"
end


get "/view_logs/:id" do
  @page_title = "View Logs"
  @user_logs = Log.logs_for_user(params["id"])
  
  erb :"logs/view_log_list"
end

get "/edit_log" do
  @page_title = "Edit Log"
  erb :"logs/edit_log_list"
end

get "/edit_log/:id" do
  @page_title = "Edit Log"
  erb :"logs/edit_log_form"
end

get "/change_log/:id" do
  column = params["edit_choice"]
  
  log_object = Log.find(params["id"].to_i)
  log_object.send("#{column}=", params["new_input"])
  log_object.save
  
  erb :"main/success"
end

get "/delete_log" do
  @page_title = "Delete Log"
  erb :"logs/delete_log_list"
end

get "/delete_log/:id" do
  log_object = Log.find(params["id"].to_i)
  log_object.delete
  
  erb :"main/success"
end