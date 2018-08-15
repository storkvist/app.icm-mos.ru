class ChangeKitFields < ActiveRecord::Migration[5.2]
  def change
    rename_column :kits, :description_en, :kit_description_en
    rename_column :kits, :description_ru, :kit_description_ru
    add_column :kits, :prototype_description_en, :text
    add_column :kits, :prototype_description_ru, :text
    add_column :kits, :packaging_description_en, :text
    add_column :kits, :packaging_description_ru, :text
  end
end
