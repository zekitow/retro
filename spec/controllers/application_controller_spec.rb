# encoding : utf-8
require 'spec_helper'

describe ApplicationController do

  describe 'not found page' do

    it 'should render custom page for not found error' do
      ActionController::Base.any_instance.should_receive(:render).with(:file => "#{Rails.root}/public/404", formats: [:html], status: :not_found, layout: false)
      ApplicationController.new.not_found
    end

  end  
end