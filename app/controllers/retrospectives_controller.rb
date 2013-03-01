# encoding : utf-8
class RetrospectivesController < ApplicationController

  before_filter :ensure_authentication

  # GET /retrospectives
  # GET /retrospectives.json
  def index
    @user = current_user
    @retrospectives = Retrospective.where(:user_id => current_user.id)
    respond_to do |format|
      format.html # index.html.erb
    end
  end

  # GET /retrospectives/new
  # GET /retrospectives/new.json
  def new
    @retrospectives = Retrospective.all
    if Retrospective.add_sprint_for(@current_user)
      notice = 'Seu novo sprint foi criado!'
    else
      notice = 'Fudeu!'
    end
    redirect_to "/retrospectives", notice: notice
  end

  # GET /retrospectives
  # GET /retrospectives.json
  def show
    @retrospective = Retrospective.find(params[:id])
    @good = Good.new
    @bad  = Bad.new
  end
end
