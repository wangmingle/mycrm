class CreateCustomers < ActiveRecord::Migration
  def change
    create_table :customers do |t|
      t.string :name
      t.string :phone
      t.string :address
      t.string :website
      t.string :email
      t.string :propers
      t.string :fax
      t.string :telephone
      t.text :memo

      t.timestamps
    end
  end
end
