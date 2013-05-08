# encoding : utf-8
class UsersController < ApplicationController

  before_filter :ensure_authentication, :only => [:edit, :update, :destroy, :index, :password, :password_update, :show]

  def index
    @users = User.all
    @user = User.new
    respond_to do |format|
      format.html # index.html.erb
    end
  end

  # GET /users/new
  # GET /users/new.json
  def new
    @user = User.new
    render layout: false
  end

  # GET /users/1/edit
  def edit
    @user = User.find(params[:id])
  end

  # GET /users/1
  def show
    @user = User.find(params[:id])
  end

  # GET /password
  def password
    @user = current_user
  end

  def password_update
    @user = current_user
    @user.password = User.md5(params[:user][:password])
    @user.password_confirmation = User.md5(params[:user][:password_confirmation])

    respond_to do |format|
      if !params[:user][:password].blank? and @user.save
        session[:user_id] = @user.id
        format.html { redirect_to "/retrospectives", notice: 'Sua senha foi alterada!' }
      else
        format.html { render action: "password", notice: 'Suas senhas não conferem!' }
      end
    end
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(params[:user])

    respond_to do |format|
      if @user.save
        format.html { redirect_to root_url, alert: 'Sua conta foi criada!' }
      else
        format.html { render action: "new", layout: false }
      end
    end
  end

  # PUT /users/1
  # PUT /users/1.json
  def update
    @user = User.find(params[:id])
    @user.name = params[:user][:name]
    @user.email = params[:user][:email]

    respond_to do |format|
      if @user.save
        format.html { redirect_to "/retrospectives", notice: 'Seu dados foram atualizados!' }
      else
        format.html { render action: "edit" }
      end
    end
  end

  def authenticate
    user = User.authenticate(params[:email], params[:password])

    if user
      session[:user_id] = user.id
      redirect_to "/retrospectives", notice: "Olá #{user.name}, bem vindo ao Retrospectiba!"
    else
      redirect_to root_url, notice: 'Usuário ou senha inválida'
    end
  end

  def logout
    user = User.find(current_user.id)
    user.save
    session[:user_id] = nil
    redirect_to root_url, :alert => "Obrigado por ter usado o Retrospectiba!"
  end

end
