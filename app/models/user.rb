class User < ApplicationRecord
  has_many :memberships
  has_many :organizations, through: :memberships
  has_many :events
  has_many :repositories, as: :owner

  # Implements the Github Followers feature of Github Users
  # https://www.railstutorial.org/book/following_users
  has_many :active_relationships, class_name:  "Relationship",
                                  foreign_key: "follower_id",
                                  dependent:   :destroy

  has_many :passive_relationships, class_name:  "Relationship",
                                   foreign_key: "followed_id",
                                   dependent:   :destroy

  has_many :following, through: :active_relationships, source: :followed
  has_many :followers, through: :passive_relationships
end
