class ConversationMessagesController < ApplicationController
  # before_filter :authenticate_user!

  def create
    @conversation = Conversation.find(params[:conversation_id])
    @message = @conversation.conversation_messages.build(message_params)
    @message.conversation_user_id = current_order.id
    @message.save!

    @path = conversation_path(@conversation)
  end

  private

  def message_params
    params.require(:message).permit(:body)
  end
end
