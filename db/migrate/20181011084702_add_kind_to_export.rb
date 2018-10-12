class AddKindToExport < ActiveRecord::Migration[5.2]
  def change
    add_column :exports, :kind, :integer
  end
end
