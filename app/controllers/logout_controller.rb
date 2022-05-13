class LogoutController < ApplicationController
  before_action :require_user_logged_in!
  def logout
    session[:user_id] = nil
    redirect_to root_path
  end
end
