# encoding : utf-8
class RetrospectivesController < ApplicationController

  before_filter :ensure_authentication

  # GET /retrospectives
  # GET /retrospectives.json
  def index
    @user = current_user
    @retrospectives = Retrospective.where(:user_id => current_user.id)
    @retrospective = Retrospective.new
    respond_to do |format|
      format.html # index.html.erb
    end
  end

  def create
    @retrospective = Retrospective.new(params[:retrospective])
    @retrospective.user = @current_user

    if @retrospective.save
      notice = 'Sua nova retro foi criada!'
    else
      notice = 'LESSSS! Tente novamente.'
    end

    redirect_to '/retrospectives', notice: notice
  end

  # GET /retrospectives
  # GET /retrospectives.json
  def show
    @retrospective = Retrospective.find(params[:id])
    @worst = Retrospective.where("user_id = #{@current_user.id} and id < #{params[:id]}").order('created_at desc').first
    @good = Good.new
    @bad  = Bad.new
  end
end
