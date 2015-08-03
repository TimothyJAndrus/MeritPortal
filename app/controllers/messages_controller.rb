class MessagesController < ApplicationController
  before_action :authenticate_mentee!

  def new
    @chosen_recipient = User.find_by(id: params[:to].to_i) if params[:to]
  end

  def create
  end

end
