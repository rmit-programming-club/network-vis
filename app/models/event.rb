class Event < ApplicationRecord
  belongs_to :repository
  belongs_to :user
  belongs_to :organization
end
