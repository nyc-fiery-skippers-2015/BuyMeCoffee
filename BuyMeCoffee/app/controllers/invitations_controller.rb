class InvitationsController < ApplicationController

  def index
    @invitations = Invitation.where(mentor_id: session[:user_id])

    @sent = Invitation.where(user_id: session[:user_id])
    render :index, locals:{invitations:@invitations, sent:@sent} , layout: false
  end

  def create
    @invitation = Invitation.new(user_id: session[:user_id], mentor_id: params[:invitation][:mentor_id], question: params[:invitation][:question], agreed_time: params[:invitation][:agreed_time], location: params[:invitation][:location])
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
