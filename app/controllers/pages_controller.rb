class PagesController < ApplicationController

  def page
    @title = params[:page]
    @content = params[:page] + " in category " + params[:category]

  end

end
