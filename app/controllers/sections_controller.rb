class SectionsController < ApplicationController
  before_filter :is_user_signed_in

  def new
    @section = Section.new
    @section.visible = true
    @method = "Add"
    render 'modify'
  end

  def create
    @section = Section.new(params[:section])
    pos = Section.all
    @section.position = largest_position(pos) + 1
    @section.home = "home"
    if @section.save
      @section.pages.create!(name: "Home", alias: "home", description: "Default home page.", content: "This is the default home page for the newly created section " + @section.name + "!<br/><br/>Edit this section to edit the home page or change the home page to an existing page though the edit menu.", visible: true, position: 1)
      redirect_to "/administrator/" + @section.id.to_s + "/pages"
    else
      @method = "Add"
      render 'modify'
    end
  end

  def edit
    @section = Section.find(params[:id])
    if !@section.nil?
      @method = "Modify"
      render 'modify'
    else
      @method = "Modify"
      redirect_to "/administrator/sections"
    end
  end

  def update
    @section = Section.find(params[:id])
    if @section.update_attributes(params[:section])
      redirect_to "/administrator/sections"
    else
      @method = "Modify"
      render 'modify'
    end
  end

  def destroy
    @section = Section.find(params[:id])
    @section.pages.each do |page|
      page.destroy
    end
    @section.destroy
    redirect_to "/administrator/sections"
  end


  def move_up
    section = Section.find(params[:section])
    if !section.nil?
      if section.position != 1
        current_position = section.position
        new_id = current_position - 1
        Section.find_by_position(new_id).update_attributes(position: current_position)
        section.update_attributes(position: new_id)
      end
    end

    redirect_to "/administrator/sections"
  end

  def move_down
    section = Section.find(params[:section])
    if !section.nil?
      if section.position != Section.count
        current_position = section.position
        new_id = current_position + 1
        Section.find_by_position(new_id).update_attributes(position: current_position)
        section.update_attributes(position: new_id)
      end
    end

    redirect_to "/administrator/sections"
  end


  private

  def is_user_signed_in
    is_signed_in?
  end

end
