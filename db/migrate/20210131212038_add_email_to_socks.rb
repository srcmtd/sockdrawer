class AddEmailToSocks < ActiveRecord::Migration[6.0]
  def change
    add_column :socks, :email, :string
  end
end
