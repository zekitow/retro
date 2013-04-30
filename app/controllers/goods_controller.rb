# encoding : utf-8
class GoodsController < ApplicationController

  before_filter :ensure_authentication

  # POST /goods
  def create
    good = Good.new(params[:good])
    good.save
    redirect_to retrospective_path(params[:retrospective_id])
  end

  # PUT /goods
  def update
  end

  # DELETE /goods
  def destroy
    good = Good.find(params[:id])
    good.destroy
    respond_to do |format|
       format.json { render :json => good }
    end
  end

end
