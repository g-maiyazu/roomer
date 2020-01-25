class MapsController < ApplicationController
  before_action :set_map, only: %i(show edit update destroy)

  def index
    @maps = Map.all
    @hash = Gmaps4rails.build_markers(@maps) do |map, marker|
      marker.lat map.latitude
      marker.lng map.longitude
      marker.infowindow map.name
    end
  end
end