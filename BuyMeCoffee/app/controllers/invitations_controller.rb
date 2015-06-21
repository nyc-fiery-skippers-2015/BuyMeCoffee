class InvitationsController < ApplicationController
  def create
    @invitation = Invitation.new(user_id: session[:user_id], mentor_id: 1, question: params[:invitation][:question])
    byebug
    @invitation.save
    redirect_to root_url
  end

  def update
    @invitation = Invitation.find_by(mentor_id: session[:user_id])
    @invitation[:status] = true
    redirect_to root_url
  end

  private

  def invitation_params
    params.require(:invitation).permit(:question)
  end
end
