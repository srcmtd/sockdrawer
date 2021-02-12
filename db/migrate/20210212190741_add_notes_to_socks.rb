class AddNotesToSocks < ActiveRecord::Migration[6.0]
  def change
    add_column :socks, :notes, :text
  end
end
