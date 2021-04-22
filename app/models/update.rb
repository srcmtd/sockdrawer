class Update < ApplicationRecord
  self.implicit_order_column = "created_at"

  belongs_to :sock

  has_rich_text :body
end
