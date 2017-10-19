class Property < ApplicationRecord

  belongs_to :user

  geocoded_by :full_street_address
  after_validation :geocode, if: :address_changed_and_lat_long_blank?

  def address_changed_and_lat_long_blank?
    if ((self.longitude.blank? && self.latitude.blank? )|| (self.longitude.nill? && self.latitude.nill? ))
      return true
    else
      return false
    end
  end

  def full_street_address
    return "#{town} #{city} #{country}"
  end

  def full_street_address_display
    # return "#{user.first_name} #{user.last_name} #{propertytype}  #{house_num} #{town} #{city} #{country}"
    return "#{propertytype}  #{house_num} #{town} #{city} #{country}"
  end

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

end #end class
