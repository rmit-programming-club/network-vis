class Repository < ApplicationRecord
  belongs_to :owner, polymorphic: true
  has_many :events
  has_many :contributions
  has_many :users, through: :contributions
  alias_attribute :contributors, :users
end
