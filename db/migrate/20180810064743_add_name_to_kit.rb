class AddNameToKit < ActiveRecord::Migration[5.2]
  def change
    add_column :kits, :name, :string
  end
end
