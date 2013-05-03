class HomeController < ApplicationController
  # GET /home
  # GET /home.json
  def index
    if session[:user]
      redirect_to retrospectives_path
    else
      render layout: false
    end
  end
end
