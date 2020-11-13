require_relative '../../lib/codename_generator'

class Sock < ApplicationRecord
  self.implicit_order_column = "created_at"

  validates :code_name, presence: true
  
  before_validation :set_code_name, on: :create

  def full_name
    parts = [self.first_name, self.middle_name, self.last_name]
    parts.compact!
    parts.join ' '
  end

  def set_full_name
    self.first_name = Faker::Name.first_name
    self.middle_name = Faker::Name.middle_name
    self.last_name = Faker::Name.last_name
  end

  private

  def set_code_name
    self.code_name = CodenameGenerator.get
  end
end
