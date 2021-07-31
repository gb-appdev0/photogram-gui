class UserController < ApplicationController

  def user_list
    @list_of_users = User.all.order("ID")
    render("user_template/list_of_users.html.erb")
  end

end