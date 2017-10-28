class PicturesController < ApplicationController
  def new_form
    render("pic_templates/blank_form.html.erb")
  end
  
  def create_row
    
    p = Photo.new
    p.source = params["the_source"]
    p.caption = params["the_caption"]
    p.save
    
    @photo_count = Photo.count
    
    redirect_to("/photos")
  end
  
  def index
    @all_photos = Photo.all
    
    render("pic_templates/list_of_all.html.erb")
  end
  
  def show
    visited_id = params["the_id"]
    
    p = Photo.find(visited_id)
    
    @the_caption = p.caption
    
    @the_image_url = p.source
    
    render("pic_templates/details.html.erb")
  end
  
  def edit_form

    edited_id = params["an_id"]
    
    p = Photo.find(edited_id)
    
    @the_caption = p.caption
    
    @the_image_url = p.source
    
    @the_image_id = p.id
    
    render("pic_templates/prefilled_form.html.erb")
  end
  
  def update_row
    updated_id = params["some_id"]
    
    @updated_id = updated_id
    
    p = Photo.find(updated_id)
    
    p.source = params["the_source"]
    
    p.caption = params["the_caption"]
    
    p.save
    
    redirect_to("/photos/#{@updated_id}")
  end
  
  def destroy_row
    
    deleted_id = params["toast_id"]
    
    p = Photo.find(deleted_id)
    
    p.destroy
    
    redirect_to("/photos")
  end
end