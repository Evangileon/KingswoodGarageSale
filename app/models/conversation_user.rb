class ConversationUser < ActiveRecord::Base


  validates_presence_of :name

  has_many :conversations, :foreign_key => :sender_id
end
