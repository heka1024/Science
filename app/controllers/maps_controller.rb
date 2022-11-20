class MapsController < ApplicationController
  def show
  end

  def index
    last_id = params[:last_id]&.to_i
    @points = if last_id.nil?
      Point.all.limit(1000)
    else
      Point.where('id < ?', last_id).limit(1000)
    end
    respond_to do |format|
      format.html
      format.json { render json: list }
    end
  end

  private

  def list
    @points.pluck(:latitude, :longitude, :id).map do |latitude, longitude, id|
      {
        id: id,
        latitude: latitude,
        longitude: longitude
      }
    end
  end
end
