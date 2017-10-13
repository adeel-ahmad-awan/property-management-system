class PageController < ApplicationController
  def home
    @properties = Property.all
    # @properties = Property.search(params[:search])
  end

  def about
  end
end
