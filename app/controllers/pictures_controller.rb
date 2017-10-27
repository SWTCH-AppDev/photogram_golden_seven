class PicturesController < ApplicationController
  def new_form
    render("pic_templates/blank_form.html.erb")
  end
  
  def create_row
    render("pic_templates/added_row.html.erb")
  end
  
  def index
    @all_photos = Photo.all
    
    render("pic_templates/list_of_all.html.erb")
  end
  
  def show
    # Parameters: {"the_id"=>"20"}
    
    visited_id = params["the_id"]
    
    p = Photo.find(visited_id)
    
    @the_caption = p.caption
    
    @the_image_url = p.source
    
    render("pic_templates/details.html.erb")
  end
  
  def edit_form
    render("pic_templates/prefilled_form.html.erb")
  end
  
  def update_row
    render("pic_templates/modified_row.html.erb")
  end
  
  def destroy_row
    render("pic_templates/removed_row.html.erb")
  end
end