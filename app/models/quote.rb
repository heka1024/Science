class Quote < ApplicationRecord
  include Paginable

  validates :name, presence: true

  scope :ordered, -> { order(id: :desc) }
end
