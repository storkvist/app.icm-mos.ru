class CreateExportedKits < ActiveRecord::Migration[5.2]
  def change
    create_table :exported_kits do |t|
      t.references :export, foreign_key: true
      t.references :kit, foreign_key: true

      t.timestamps
    end
  end
end
