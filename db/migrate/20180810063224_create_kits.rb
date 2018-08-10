class CreateKits < ActiveRecord::Migration[5.2]
  def change
    create_table :kits do |t|
      t.references :scale, foreign_key: true
      t.references :category, foreign_key: true
      t.string :article
      t.text :description
      t.integer :year

      t.timestamps
    end
  end
end
