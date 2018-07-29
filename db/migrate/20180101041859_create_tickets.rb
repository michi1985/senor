class CreateTickets < ActiveRecord::Migration
  def change
    create_table :tickets do |t|
      t.references :store, null: false #外部キー
      #t.string :store_code, null: false
      t.text :title, null: false
      t.string :status, null: false
      t.string :sender
      t.string :received_user_id
      t.string :assign_user_id
      t.date :receive_date, null: false
      t.time :receive_time, null: false
      t.date :close_date
      t.time :close_time
      # t.date :esc_date
      # t.time :esc_time
      t.date :limit_date
      t.text :content
      t.text :detail
      t.text :result
      t.text :remarks
      t.timestamps
    end

    #add_index :tickets, :
    #add_foreign_key :tickets, :stores, column: "store_code"
  end
end
