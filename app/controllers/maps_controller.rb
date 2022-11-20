class MapsController < ApplicationController
  def show
  end

  def index
    @points = Point.all.limit(10_000)
    respond_to do |format|
      format.html
      format.json { render json: list }
    end
  end

  private

  def list
    @points.pluck(:latitude, :longitude).map do |latitude, longitude|
      {
        latitude: latitude,
        longitude: longitude
      }
    end
  end
end
