class MapsController < ApplicationController
  def show
  end

  def index
    @points = Point.all
  end
end
