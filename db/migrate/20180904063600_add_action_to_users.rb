class AddActionToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :permission, :integer, default: 0
  end
end
