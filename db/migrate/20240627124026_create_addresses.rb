class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.references :customer, null: false
      t.string :type, null: false

      t.string :postal_code, null: false
      t.string :prefecture, null: false
      t.string :city, null: false
      t.string :address1, null: false # 町域、番地など
      t.string :address2, null: false # 建物名、部屋番号など

      t.string :company_name, null: false, default: ''
      t.string :division_name, null: false, default: ''

      t.timestamps
    end

    add_index :addresses, [ :type, :customer_id ], unique: true
    add_foreign_key :addresses, :customers
  end
end
