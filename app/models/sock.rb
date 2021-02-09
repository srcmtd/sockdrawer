require_relative '../../lib/codename_generator'

class Sock < ApplicationRecord
  self.implicit_order_column = "created_at"

  validates :code_name, presence: true
  validates :email, uniqueness: true, allow_blank: true
  validates :first_name, uniqueness: { scope: :last_name }
  
  before_validation :set_code_name, on: :create

  scope :clean, -> { where(marked_dirty_at: nil) }
  scope :dirty, -> { where.not(marked_dirty_at: nil) }

  def clean!
    update! marked_dirty_at: nil
  end

  def dirty!
    update! marked_dirty_at: Time.current
  end

  def dirty?
    self.marked_dirty_at.present?
  end

  def city_and_state
    [self.city, self.state].compact.join ', '
  end

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

  def set_location
    common_locations = [
      ["Los Angeles", "California"],
      ["San Diego", "California"],
      ["San Francisco", "California"],
      ["Oakland", "California"],
      ["Berkeley", "California"],
      ["Washington", "District of Columbia"],
      ["Baltimore", "Maryland"],
      ["Boston", "Massachusetts"],
      ["Cambridge", "Massachusetts"],
      ["Bethesda", "Maryland"],
      ["Jersey City", "New Jersey"],
      ["Newark", "New Jersey"],
      ["Patterson", "New Jersey"],
      ["Trenton", "New Jersey"],
      ["New York City", "New York"],
      ["Yonkers", "New York"],
      ["Bend", "Oregon"],
      ["Hillsboro", "Oregon"],
      ["Portland", "Oregon"],
      ["Philadelphia", "Pennsylvania"],
      ["Memphis", "Tennessee"],
      ["Nashville", "Tennessee"],
      ["Austin", "Texas"],
      ["Dallas", "Texas"],
      ["Houston", "Texas"],
      ["Round Rock", "Texas"],
      ["San Antonio", "Texas"],
      ["Bellevue", "Washington"],
      ["Redmond", "Washington"],
      ["Seattle", "Washington"],
      ["Tacoma", "Washington"],
    ]
    choice = common_locations.sample

    self.city = choice.first
    self.state = choice.second
    self.country = "United States"
  end

  private

  def set_code_name
    self.code_name ||= CodenameGenerator.get
  end
end
