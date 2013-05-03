# encoding : utf-8
class ApplicationController < ActionController::Base
  protect_from_forgery
  #rescue_from Exception, with: :internal_error

  def ensure_authentication
    if not session[:user_id]
      redirect_to root_url, :notice => "Você esqueceu fazer o login!"
    else
      @current_user = current_user
    end
  end

  def current_user
    User.find(session[:user_id])
  end

  #def not_found
  #  render(:file => "#{Rails.root}/public/404", formats: [:html], status: :not_found, layout: false)
  #end

  #def internal_error
  #  render(:file => "#{Rails.root}/public/500", formats: [:html], status: :internal_server_error, layout: false)
  #end

end
