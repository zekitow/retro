# encoding : utf-8
require 'spec_helper'

describe RetrospectivesController do

  before(:each) { controller.session[:user] = FactoryGirl.build(:user) }

  describe "POST #create" do
    subject { post :create, retrospective: retrospective  }

    describe "with invalid attributes" do
      let(:retrospective) { FactoryGirl.attributes_for(:invalid_retrospective) }

      it 'does not save the new retrospective' do
        expect { subject }.to_not change(Retrospective, :count)
      end

      it 're-renders the index' do
        subject.should redirect_to '/retrospectives'
      end
    end

    describe "with valid attributes" do
      let(:retrospective) { FactoryGirl.attributes_for(:retrospective) }

      it 'saves the new retrospective' do
        expect { subject }.to change(Retrospective, :count).by(1)
      end

      it 're-renders the index' do
        subject.should redirect_to '/retrospectives'
      end
    end
  end
end
