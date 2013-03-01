# encoding : utf-8
class BadsController < ApplicationController

  before_filter :ensure_authentication

  # POST /bads
  def create
    bad = Bad.new(params[:bad])
    bad.save
    redirect_to retrospective_path(params[:retrospective_id])
  end
end
