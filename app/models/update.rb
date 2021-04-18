class Update < ApplicationRecord
  belongs_to :sock

  has_rich_text :body
end
