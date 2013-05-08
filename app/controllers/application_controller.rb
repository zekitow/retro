# encoding : utf-8
class ApplicationController < ActionController::Base
  protect_from_forgery
  rescue_from Exception, with: :internal_error

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

  def not_found(error = nil)
    log_error(error) if error.present?
    render(:file => "#{Rails.root}/public/404", formats: [:html], status: :not_found, layout: false)
  end

  def internal_error(error = nil)
    log_error(error) if error.present?
    render(:file => "#{Rails.root}/public/500", formats: [:html], status: :internal_server_error, layout: false)
  end

  def log_error(error)
    info = ''
    info << "Error #{error.class} - #{error.message.inspect}\n"
    info << "Params - #{params.inspect}\n"

    trace = error.respond_to?(:application_trace) ? error.application_trace : error.backtrace
    info << "Trace - #{trace.join("\n")}"

    Rails.logger.error(info)

    nil
  end
end
