class PagesController < ApplicationController
  before_filter :is_user_signed_in

  def new
    @section = Section.find(params[:section_id])
    @page = @section.pages.build
    @method = "Add"
    render 'modify'
  end

  def create
    @section = Section.find(params[:section_id])
    if @section.pages.create!(params[:page])
      redirect_to "/administrator/sections/" + @section.id.to_s + "/pages"
    else
      @method = "Add"
      render 'modify'
    end
  end

  def edit
    @section = Section.find(params[:section_id])
    if !@section.nil?
      @method = "Modify"
      @page = @section.pages.find(params[:id])
      render 'modify'
    else
      redirect_to "/administrator/sections"
    end
  end

  def update
    @section = Section.find(params[:section_id])
    @page = @section.pages.find(params[:id])
    if @page.update_attributes(params[:page])
      redirect_to "/administrator/sections/" + @section.id.to_s + "/pages"
    else
      @method = "Modify"
      render 'modify'
    end
  end

  def destroy
    @section = Section.find(params[:section_id])
    @page = @section.page.find(params[:id]).delete
    redirect_to "/administrator/sections/" + @section.id.to_s + "/pages"
  end


  def move_up
    @section = Section.find(params[:section])
    if (!@section.nil?)
      page = @section.pages.find(params[:page])
      if (!page.nil?)
        if (page.position != 1)
          current_position = page.position.to_i
          new_position = current_position - 1
          @section.pages.find_by_position(new_position).update_attributes(position: current_position)
          page.update_attributes(position: new_position)
        end
      end
    end
    redirect_to "/administrator/" + @section.id.to_s + "/pages"
  end

  def move_down
    @section = Section.find(params[:section])
    if (!@section.nil?)
      page = @section.pages.find(params[:page])
      if (!page.nil?)
        if page.position != @section.pages.size
          current_position = page.position
          new_position = current_position + 1
          @section.pages.find_by_position(new_position).update_attributes(position: current_position)
          page.update_attributes(position: new_position)
        end
      end
    end
    redirect_to "/administrator/" + @section.id.to_s + "/pages"
  end


  private

  def is_user_signed_in
    is_signed_in?
  end
end
