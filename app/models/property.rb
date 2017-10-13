class Property < ApplicationRecord
  belongs_to :user

  geocoded_by :full_street_address   # can also be an IP address
  after_validation :geocode          # auto-fetch coordinates

  def full_street_address
    return "#{town} #{city} #{country}"
  end

  def full_street_address_display
    return "#{house_num} #{town} #{city} #{country}"
  end

end
