# encoding : utf-8
require 'spec_helper'

describe BadsController do

  before(:each) { controller.session[:user] = FactoryGirl.build(:user) }

  describe "GET keep" do
    subject { post :keep, retrospective_id: params_stub[:retrospective_id], id: params_stub[:id] }

    context "with invalid attributes" do
      let(:params_stub) { { :id => "", :retrospective_id => "" } }

      it 'should not keep the bad post-it' do
        expect { subject }.to_not change(Bad, :count)
      end

      its(:status)	{ should eq 500 }
      its(:body)	{ should include "Error" }

    end

    context "with valid attributes" do
      let(:params_stub) { { :id => "4567", :retrospective_id => 120 } }
      let(:bad)		{ Bad.new(:id => params_stub[:id], :retrospective_id => params_stub[:retrospective_id]) }

      before do
        BadsController.stub(:params).and_return(params_stub)
        Bad.stub(:find).with(params_stub[:id]).and_return(bad)
        bad.stub(:save).and_return(true)
      end

      it 'should find Bad by id' do
	Bad.should_receive(:find).with(params_stub[:id])
	subject
      end

      it 'should assign retrospective_id' do
        subject
        bad.retrospective_id.should eq params_stub[:retrospective_id]
      end

      it 'should preffix description' do
       bad.should_receive(:preffix_description!).once
       subject
      end

      it 'should save bad' do
        bad.should_receive(:save).once
        subject
      end

      it 'should redirect to retrospective_path' do
        subject.should redirect_to retrospective_path(params_stub[:retrospective_id])
      end

      its(:status) { should eq 302 }

      context 'when save returns false' do

        before do
          bad.stub(:save).and_return(false)
        end

        its (:status) { should eq 500 }
      end
    end
  end
end
