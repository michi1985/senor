class CreateCustomers < ActiveRecord::Migration
  def change
    create_table :customers do |t|
      t.string :customer_name
      t.string :postal_code
      t.string :business
      t.string :prefectures
      t.string :city
      t.string :town_name
      t.string :phone_number
      t.string :fax_number
      t.string :url

      t.timestamps
    end
  end
end
