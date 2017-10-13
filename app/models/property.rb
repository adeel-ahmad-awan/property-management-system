class Property < ApplicationRecord
  belongs_to :user

  geocoded_by :full_street_address_display   # can also be an IP address
  after_validation :geocode          # auto-fetch coordinates

  def self.search(search)
    if search
      self.where("house_num LIKE ?
                  OR town LIKE ?
                  OR city LIKE ?
                  OR country LIKE ?
                  OR propertytype LIKE ?
                  OR price_for_sale LIKE ?
                  OR price_for_rent LIKE ?",
                  "%#{search}%",
                  "%#{search}%",
                  "%#{search}%",
                  "%#{search}%",
                  "%#{search}%",
                  "%#{search}%",
                  "%#{search}%")
    else
      self.all
    end
  end

  def full_street_address
    return "#{town} #{city} #{country}"
  end

  def full_street_address_display
    return "#{house_num} #{town} #{city} #{country}"
  end

end
