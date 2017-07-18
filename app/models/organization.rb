class Organization < ApplicationRecord
  has_many :memberships
  has_many :users, through: :memberships
  alias_attribute :members, :users
  has_many :events
  has_many :repositories, as: :owner
end
