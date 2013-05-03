class Retrospectives::InvitationsController < ApplicationController

  before_filter :ensure_authentication

  def new
    @retrospective = Retrospective.find(params[:retrospective_id])
  end

  def create
    retrospective = Retrospective.find(params[:retrospective_id])
    users_id = params[:users_id]
    retrospective.invited_users.delete_all
    users_id.each { |user_id| retrospective.invited_users << User.find(user_id) }
    redirect_to user_retrospectives_path(@current_user)
  end

end
