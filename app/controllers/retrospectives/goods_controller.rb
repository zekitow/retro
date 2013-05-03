class Retrospectives::GoodsController < ApplicationController
  before_filter :ensure_authentication

  def create
    good = Good.new(params[:good])
    good.save
    redirect_to retrospective_path(params[:retrospective_id])
  end

  def destroy
    good = Good.find(params[:id])
    good.destroy
    respond_to do |format|
       format.json { render :json => good }
    end
  end

  def update
    good = Good.find(params[:id])
    if good.update_attributes(params[:good])
      head :ok
    else
      head :error
    end
  end
end
