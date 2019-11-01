class CreateApartments < ActiveRecord::Migration[6.0]
  def change
    create_table :apartments do |t|
      t.string :apartment_id
      t.string :zip_code
      t.string :apartment_type
      t.integer :apartment_size
      t.decimal :rent
      t.boolean :deleted
      t.timestamps
    end
  end
end
