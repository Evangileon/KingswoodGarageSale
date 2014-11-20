class ConversationMessage < ActiveRecord::Base
  belongs_to :conversation
  belongs_to :conversation_user

  validates_presence_of :body, :conversation_id, :conversation_user_id
end
