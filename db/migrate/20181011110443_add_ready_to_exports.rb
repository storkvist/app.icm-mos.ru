class AddReadyToExports < ActiveRecord::Migration[5.2]
  def change
    add_column :exports, :ready, :boolean, default: false
  end
end
