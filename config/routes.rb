Rails.application.routes.draw do

  get("/users", { :controller => "user", :action => "user_list"})

end
