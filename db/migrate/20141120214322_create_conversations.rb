class CreateConversations < ActiveRecord::Migration
  def up
    create_table :conversations do |t|
      t.integer :sender_id
      t.integer :recipient_id

      t.timestamps
    end

    add_index :conversations, :sender_id
    add_index :conversations, :recipient_id
  end

  def down
    drop_table :conversations
  end
end
