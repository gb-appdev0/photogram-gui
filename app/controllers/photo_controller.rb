class PhotoController < ApplicationController

  def photo_list
    @list_of_photos = Photo.all.order({:created_at => :desc})

    render("/photo_template/index.html.erb")

  end

  def photo_details
    @identifier = params.fetch("identifier")
    @photo = Photo.all.where({:id => @identifier })[0]
    @comments = @photo.comments

    render("/photo_template/show.html.erb")
  end

  def delete
    @identifier = params.fetch("identifier")
    @photo = Photo.all.where({:id => @identifier })[0]
    @photo.destroy
    #render("/photo_template/delete_photo.html.erb")
    redirect_to("/photos")
  end

  def create
    # {"input_image"=>"image", "input_caption"=>"caption", "input_owner_id"=>"owner"}

    url = params.fetch("input_image")
    caption = params.fetch("input_caption")
    owner = params.fetch("input_owner_id")
    new_photo = Photo.new
    new_photo.caption = caption
    new_photo.image = url
    new_photo.owner_id = owner
    new_photo.save
    redirect_to("/photos/" + new_photo.id.to_s)
  end

  def update_photo

    #  Parameters: {"input_image"=>"https://www.thespruce.com/a4000090f0714f59a8ec6201ad250d90.jpg", "input_caption"=>"Second Test", "identifier"=>"952"}
    id = params.fetch("identifier")
    photo = Photo.all.where(:id => id)[0]
    url = params.fetch("input_image")
    caption = params.fetch("input_caption")

    photo.image = url
    photo.caption = caption
    photo.save

    #render("/photo_template/update.html.erb")
    redirect_to("/photos/" + id)
  end

  def add_comment
    #  Parameters: {"input_photo_id"=>"952", "input_author_id"=>"117", "input_body"=>"Test1"}

    id = params.fetch("input_photo_id")
    author = params.fetch("input_author_id")
    comment = params.fetch("input_body")

    new_com = Comment.new
    new_com.photo_id = id
    new_com.author_id = author
    new_com.body = comment
    new_com.save

    redirect_to("/photos/" + id.to_s )
  end

end