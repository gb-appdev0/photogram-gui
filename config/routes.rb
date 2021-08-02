Rails.application.routes.draw do

  get("/users", { :controller => "user", :action => "user_list"})
  get("/", { :controller => "user", :action => "user_list"})
  get("/users/:username", { :controller => "user", :action => "user_detail"})

  get("/photos", { :controller => "photo", :action => "photo_list"})
  get("/photos/:identifier", { :controller => "photo", :action => "photo_details"})

  get("/delete_photo/:identifier", { :controller => "photo", :action => "delete"})

  get("/insert_photo_record", { :controller => "photo", :action => "create"})

  get("/update_photo/:identifier", { :controller => "photo", :action => "update_photo"})

  get("/insert_comment_record", { :controller => "photo", :action => "add_comment"})

  get("/insert_user_record", { :controller => "user", :action => "add_user"})

  get("/update_user/:identifier", { :controller => "user", :action => "update_user"})

end
