class RemoveKindFromExports < ActiveRecord::Migration[5.2]
  def change
    remove_column :exports, :kind, :integer
  end
end
