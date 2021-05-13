class User < ApplicationRecord
  has_many :posts

  def self.bad_query
    self.all.each do |user|
      user.posts.each do |post|
        puts post.content
      end
    end
  end

  def self.good_query
    self.includes(:posts).all.each do |user|
      user.posts.each do |post|
        puts post.content
      end
    end
  end
end
