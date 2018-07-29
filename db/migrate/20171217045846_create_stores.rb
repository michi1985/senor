class CreateStores < ActiveRecord::Migration
  def change
    create_table :stores do |t|
      t.references :customer, null: false #外部キー
      t.string :store_code
      t.string :store_name
      t.string :postal_code
      t.string :prefectures
      t.string :city
      t.string :town_name
      t.string :phone_number
      t.string :fax_number
      t.string :business_hours_start
      t.string :business_hours_end
      t.string :pos_type
      t.string :ip_address
      t.text :remarks

      t.timestamps
    end
  end
end
