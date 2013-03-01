# encoding : utf-8
class ApplicationController < ActionController::Base
  protect_from_forgery

  def ensure_authentication
    if not session[:user]
      redirect_to root_url, :notice => "Você esqueceu fazer o login!"
    else
      @current_user = session[:user]
    end
  end

  def current_user
    session[:user]
  end
end
