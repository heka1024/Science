# frozen_string_literal: true

module Paginable
  extend ActiveSupport::Concern

  included do
    scope :page, ->(page = 1, per_page = 10) do
      offset(page * per_page).limit(per_page)
    end
  end
end
