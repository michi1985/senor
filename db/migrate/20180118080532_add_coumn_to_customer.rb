class AddCoumnToCustomer < ActiveRecord::Migration
  def change
    add_column :customers, :stores_count, :integer, default: 0
  end
end
