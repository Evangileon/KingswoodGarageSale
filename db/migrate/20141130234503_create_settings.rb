class CreateSettings < ActiveRecord::Migration
  def up
    create_table :settings do |t|
      t.string "key"
      t.string "value"
      t.string "value_type"
    end
  end

  def down
    drop_table :settings
  end
end
