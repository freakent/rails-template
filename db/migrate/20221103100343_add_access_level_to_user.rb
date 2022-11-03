class AddAccessLevelToUser < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :access_level, :integer, default: 0
    change_column_null :users, :access_level, false, 0
  end
end
