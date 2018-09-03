class AddBarcodeToKits < ActiveRecord::Migration[5.2]
  def change
    add_column :kits, :barcode, :string
  end
end
