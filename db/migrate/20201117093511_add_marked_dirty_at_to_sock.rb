class AddMarkedDirtyAtToSock < ActiveRecord::Migration[6.0]
  def change
    add_column :socks, :marked_dirty_at, :datetime
  end
end
