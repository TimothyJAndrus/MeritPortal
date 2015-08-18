class MessagesController < ApplicationController
  before_action :authenticate!

  def new
    @chosen_recipient = User.find_by(id: params[:to].to_i) if params[:to]
  end

  def create
  end

  private
  def authenticate!
    :authenticate_mentor! || :authenticate_mentee!
    @current_user = mentor_signed_in? ? current_mentor : current_mentee
  end

end
