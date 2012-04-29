class PageController < ApplicationController

  def page
    sec = Section.find_by_alias(params[:section])
    if !sec.nil?

      @submenu = sec

      page = sec.pages.find_by_alias(params[:page])
      if !page.nil?
        @title = page.name
        @content = page.content.html_safe
      else
        @title = "Error"
        @content = "An error has occurred. There is no page \"" + params[:page] + "\" in \"" + params[:section] +"\" on this site."
      end
    else
      @title = "Error"
      @content = "An error has occurred. There is no section \"" + params[:section] + "\" on this site."
    end
  end

  def home
    sec = Section.find_by_alias(params[:section])
    if !sec.nil?

      @submenu = sec

      page = sec.pages.find_by_alias(sec.home)
      if !page.nil?
        @title = page.name
        @content = page.content.html_safe
      else
        @title = "Error"
        @content = "An error has occurred. There is no page \"" + sec.home + "\" in \"" + params[:sections] +"\" on this site."
      end
    else
      @title = "Error"
      @content = "An error has occurred. There is no section \"" + params[:sections] + "\" on this site."
    end
    render 'page'
  end

end
