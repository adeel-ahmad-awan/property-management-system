class PageController < ApplicationController

  def home
    @properties = Property.search(params[:search])
  end

  def allpropertiesonmap
    @properties = Property.all
    @hash = Gmaps4rails.build_markers(@properties) do |property, marker|
      marker.lat property.latitude
      marker.lng property.longitude
      marker.infowindow property::full_street_address_display
    end
  end

  def about
  end

end
