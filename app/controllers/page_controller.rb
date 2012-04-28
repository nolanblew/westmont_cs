class PageController < ApplicationController
  before_filter :is_signed_in

  def new
    @section = Section.new
    @method = "Add"
    render 'modify'
  end

  def create
    @section = Section.new(params[:sections])
    if @section.save
      redirect_to "/administrator/sections"
    else
      @method = "Add"
      render 'modify'
    end
  end

  def edit
    @section = Section.find(params[:id])
    if !@sectin.nil?
      render 'modify'
    else
      @method = "Modify"
      redirect_to "/administrator/sections"
    end
  end

  def update
    @section = Section.find(params[:id])
    if @section.update_attributes(params[:sections])
      redirect_to "/administrator/sections"
    else
      @method = "Modify"
      render 'modify'
    end
  end

  def destroy
    @section = Section.find[:id]
    @section.pages.each do |page|
      page.destroy
    end
    @section.destroy
    redirect_to "/administrator/sections"
  end

end
