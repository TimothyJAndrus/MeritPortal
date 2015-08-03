class ConversationsController < ApplicationController
  before_action :authenticate_mentee!
  before_action :get_mail
  before_action :get_conversation, except: :index

  def index
    @conversations = @mailbox.inbox
  end

  def show
  end

  private
  def get_mail
    @mailbox = current_mentee.mailbox
  end

  def get_conversation
    @conversation = @mailbox.conversations.find(params[:id])
  end

end
