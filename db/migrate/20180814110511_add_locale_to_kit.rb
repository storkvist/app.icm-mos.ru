class AddLocaleToKit < ActiveRecord::Migration[5.2]
  def change
    rename_column :kits, :name, :name_ru
    rename_column :kits, :description, :description_ru
    add_column :kits, :name_en, :string
    add_column :kits, :description_en, :text
  end
end
