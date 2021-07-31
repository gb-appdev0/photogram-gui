class UserController < ApplicationController

  def user_list
    @list_of_users = User.all.order({ :username => :asc })
    render("user_template/list_of_users.html.erb")
  end

  def user_detail
    @name = params.fetch("username")
    @user = User.all.where({:username => @name})[0]
    if @user == nil
      redirect_to("/404")
    else
      render("user_template/show_user.html.erb")
    end
  end

end