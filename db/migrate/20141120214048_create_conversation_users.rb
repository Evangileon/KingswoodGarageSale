class CreateConversationUsers < ActiveRecord::Migration
  def up
    create_table :conversation_users do |t|

      t.timestamps
    end
  end

  def down
    drop_table :conversation_users
  end
end
