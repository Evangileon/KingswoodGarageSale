class CreateConversationMessages < ActiveRecord::Migration
  def change
    create_table :conversation_messages do |t|
      t.text :body
      t.references :conversation, index: true
      t.references :conversation_user, index: true

      t.timestamps
    end
  end
end
