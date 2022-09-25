require "scientist"

class User < ApplicationRecord
  include Scientist

  has_many :posts

  def self.find_by_username(username)
    science "find_by_username" do |e|
      e.use { find_by(username: username) }
      e.try { find_by(username: username) }
    end
  end

  def posts_count
    experiment = User::CountExperiment.new("count", 50)

    experiment.use { posts.size }
    experiment.try { posts.size + 1 }

    experiment.run
  end
end
