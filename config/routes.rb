Rails.application.routes.draw do

  get("/users", { :controller => "user", :action => "user_list"})
  get("/", { :controller => "user", :action => "user_list"})
  get("/users/:username", { :controller => "user", :action => "user_detail"})

  get("/photos", { :controller => "photo", :action => "photo_list"})
  get("/photos/:identifier", { :controller => "photo", :action => "photo_details"})

  get("/delete_photo/:identifier", { :controller => "photo", :action => "delete"})

end
