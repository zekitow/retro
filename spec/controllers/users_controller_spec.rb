# encoding : utf-8
require 'spec_helper'

describe UsersController do

  def valid_attributes
    {
      :email => "zekitow@gmail.com",
      :name => "José Ribeiro",
      :password => "123456",
      :password_confirmation => "123456"
    }
  end

  before(:each) do
    user = User.new(valid_attributes)
    controller.session[:user_id] = user.id
  end

  describe "GET index" do
    it "assigns logged user" do
      user = User.create! valid_attributes
      get :index, {}
      assigns(:user).should_not be_nil
    end
  end

  describe "GET new" do
    it "assigns a new user as @user" do
      get :new, {}
      assigns(:user).should be_a_new(User)
    end
  end

  describe "GET edit" do
    it "assigns the requested user as @user" do
      user = User.create! valid_attributes
      get :edit, {:id => user.to_param}
      assigns(:user).should eq(user)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new User" do
        expect {
          post :create, {:user => valid_attributes}
        }.to change(User, :count).by(1)
      end

      it "assigns a newly created user as @user" do
        post :create, {:user => valid_attributes}
        assigns(:user).should be_a(User)
        assigns(:user).should be_persisted
      end

      it "redirects to the created user" do
        post :create, {:user => valid_attributes}
        response.should redirect_to(root_path)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved user as @user" do
        # Trigger the behavior that occurs when invalid params are submitted
        User.any_instance.stub(:save).and_return(false)
        post :create, {:user => {}}
        assigns(:user).should be_a_new(User)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        User.any_instance.stub(:save).and_return(false)
        post :create, {:user => {}}
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested user" do
        user = User.create! valid_attributes
        User.any_instance.should_receive(:save)
        put :update, {:id => user.to_param, :user => {'email' => user.email, 'name' => user.name }}
      end

      it "assigns the requested user as @user" do
        user = User.create! valid_attributes
        put :update, {:id => user.to_param, :user => valid_attributes}
        assigns(:user).should eq(user)
      end

      it "redirects to the user" do
        user = User.create! valid_attributes
        put :update, {:id => user.to_param, :user => valid_attributes}
        response.should redirect_to '/retrospectives'
      end
    end

    describe "with invalid params" do
      it "assigns the user as @user" do
        user = User.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        User.any_instance.stub(:save).and_return(false)
        put :update, {:id => user.to_param, :user => {}}
        assigns(:user).should eq(user)
      end

      it "re-renders the 'edit' template" do
        user = User.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        User.any_instance.stub(:save).and_return(false)
        put :update, {:id => user.to_param, :user => {}}
        response.should render_template("edit")
      end
    end
  end

  describe "GET password" do
    it "assigns the requested user as @user" do
      user = User.create! valid_attributes
      get :password, {}
      user.id.should eq(controller.session[:user_id])
    end
  end

  describe "PUT password_update" do
    describe "with valid params" do
      let(:user_request) { {'password' => "123", 'password_confirmation' => "123" } }

      it "updates the requested user" do
        user = User.create! valid_attributes
        User.any_instance.should_receive(:save)
        put :password_update, {:id => user.to_param, :user => user_request }
      end

      it "redirects to users" do
        user = User.create! valid_attributes
        User.any_instance.should_receive(:save).and_return(true)
        put :password_update, {:id => user.to_param, :user => user_request }
        response.should redirect_to("/retrospectives")
      end
    end

    describe "with invalid params" do
      let(:user_bad_request) { {'password' => "", 'password_confirmation' => "123" } }

      it "re-render password" do
        user = User.create! valid_attributes
        User.any_instance.stub(:save).and_return(false)
        put :password_update, {:id => user.to_param, :user => user_bad_request }
        response.should render_template("password")
      end

      it "re-render password when password and confirmation were different" do
        user = User.create! valid_attributes
        User.any_instance.stub(:save).and_return(true)
        put :password_update, {:id => user.to_param, :user => user_bad_request }
        response.should render_template("password")
      end
    end
  end
end
