class PagesController < ApplicationController
  before_action :set_current_user
  def home
    @current_user = current_user if user_signed_in?
  end
  private

  def set_current_user
    @current_user = current_user if user_signed_in?
  end

end
