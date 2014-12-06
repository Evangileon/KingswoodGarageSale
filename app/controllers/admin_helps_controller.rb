class AdminHelpsController < ApplicationController
  def index
    @conversation_users = ConversationUser.all
  end
end
