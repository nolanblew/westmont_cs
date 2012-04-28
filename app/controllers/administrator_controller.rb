class AdministratorController < ApplicationController
  before_filter :is_user_signed_in

  def sections
  end

  def pages
  end

  def users
  end


  private

  def is_user_signed_in
    is_signed_in?
  end
end
