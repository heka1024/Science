class Post < ApplicationRecord
  include Paginable

  belongs_to :user
end
