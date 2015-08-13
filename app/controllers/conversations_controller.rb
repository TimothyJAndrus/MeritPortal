class ConversationsController < ApplicationController
  before_action :authenticate!
  before_action :get_mail
  before_action :get_conversation, except: [:index, :empty_trash]
  before_action :get_box, only: :index

  def index
    if @box.eql? "inbox"
      @conversations = @mailbox.inbox
    elsif @box.eql? "sent"
      @conversations = @mailbox.sentbox
    else
      @conversations = @mailbox.trash
    end
  end

  def show
  end

  def reply
    @current_user.reply_to_conversation(@conversation, params[:body])
    flash[:success] = "Reply sent"
    redirect_to conversation_path(@conversation)
  end

  def destroy
    @conversation.move_to_trash(@current_user)
    flash[:success] = "The conversation was moved to the trash"
    redirect_to conversation_path
  end

  def restore
    @conversation.untrash(@current_user)
    flash[:success] = "The conversation was restored"
    redirect_to conversation_path
  end

  def empty_trash
    @mailbox.trash.each do |convo|
      convo.receipts_for(@current_user).update_all(deleted: true)
    end
    flash[:success] = "Your trash was emptied"
    redirect_to conversation_path
  end

  def mark_as_read
    @conversation.mark_as_read(@current_user)
    flash[:success] = "The conversation was marked as read"
    redirect_to conversation_path
  end

  private

  def get_box
    if params[:box].blank? or !["inbox","sent","trash"].include?(params[:box])
        params[:box] = 'inbox'
    end
    @box = params[:box]
  end

  def authenticate!
    :authenticate_mentor! || :authenticate_mentee!
    @current_user = mentor_signed_in? ? current_mentor : current_mentee
  end

  def get_mail
    @mailbox = @current_user.mailbox
  end

  def get_conversation
    @conversation = @mailbox.conversations.find(params[:id])
  end

end
