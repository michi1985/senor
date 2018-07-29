class AddCoumnToStore < ActiveRecord::Migration
  def change
    add_column :stores, :tickets_count, :integer, default: 0
  end
end
