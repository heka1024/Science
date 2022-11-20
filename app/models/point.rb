class Point < ApplicationRecord
  default_scope { order(id: :desc) }

  def to_h
    {
      latitude: latitude,
      longitude: longitude
    }
  end

  def self.to_h
    pluck(:latitude, :longitude).map do |latitude, longitude|
      {
        latitude: latitude,
        longitude: longitude
      }
    end
  end
end
