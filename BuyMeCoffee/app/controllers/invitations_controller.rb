class InvitationsController < ApplicationController

  def new
    if session[:user_id]
      render :json => { good: 'togo'}
    else
      render :'landing_page/error', layout: false
    end
  end

  def index
    invitations = Invitation.where(mentor_id: session[:user_id], status: false)
    accepted = Invitation.where(mentor_id: session[:user_id], status: true)
    sent_accepted = Invitation.where(user_id: session[:user_id], status: true)
    appointments = accepted + sent_accepted
    sent = Invitation.where(user_id: session[:user_id])
    render :index, locals:{invitations:invitations, sent:sent, appointments: appointments}, layout: false
  end

  def create
    if session[:user_id]
      invitation = Invitation.new(user_id: session[:user_id], mentor_id: params[:invitation][:mentor_id], question: params[:invitation][:question], agreed_time: params[:invitation][:agreed_time], location: params[:invitation][:location])
      invitation.save
      redirect_to root_url
    else
      render :'landing_page/error', layout: false
    end
  end

  def update
    invitation = Invitation.find(params[:id])
    invitation.update(status: true)
    render :json => invitation
  end

  private

  def invitation_params
    params.require(:invitation).permit(:question)
  end
end
