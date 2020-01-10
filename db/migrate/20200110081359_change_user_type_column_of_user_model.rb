class ChangeUserTypeColumnOfUserModel < ActiveRecord::Migration[5.2]
  def change
    change_column :users, :user_type, :integer, null: false, default: 9
  end
end
