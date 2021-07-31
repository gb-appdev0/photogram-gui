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

end