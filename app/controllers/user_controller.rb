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

  def add_user

    username = params.fetch("input_username")
    user = User.new
    user.username = username
    user.save
    redirect_to("/users/" + username)

  end

  def update_user
    #Parameters: {"edit_username"=>"pointilion", "identifier"=>"121"}
    id = params.fetch("identifier")
    new_username = params.fetch("edit_username")
    user = User.all.where(:id => id)[0]
    user.username = new_username
    user.save
    redirect_to("/users/" + new_username )
  end

end