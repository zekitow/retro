class VotesController < ApplicationController
  before_filter :find_retro_item
  after_filter :add_vote_to_session

  def create
    if is_allowed_to_vote?
      @item.update_attribute(:votes, @item.votes + 1)
      @user_already_voted = false
    else
      @user_already_voted = true
    end
    respond_with_js
  end

  def destroy
    if is_allowed_to_vote?
      @item.update_attribute(:votes, @item.votes - 1)
      @user_already_voted = false
    else
      @user_already_voted = true
    end
    respond_with_js
  end

  private
  def find_retro_item
    @item = params[:model].titleize.constantize.find(params[:id])
  end

  def add_vote_to_session
    session[:votes] ||= []
    session[:votes] << [@item.class, @item.id]
  end

  def is_allowed_to_vote?
    session[:votes].present? && !session[:votes].include?([@item.class, @item.id])
  end

  def respond_with_js
    respond_to {|format| format.js }
  end
end
