module Admin
  class CreateUsers < ActiveRecord::Migration
    def up
      create_table :users do |t|
        t.string "first_name"
        t.string "last_name"
        t.string "email_address"
        t.string "password_digest"
        t.datetime "created_at"
        t.datetime "updated_at"

        t.timestamps
      end
    end

    def down
      drop_table :users
    end
  end
end
