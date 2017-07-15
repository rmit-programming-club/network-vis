require 'rails_helper'

RSpec.describe Relationship, type: :model do
  before(:all) do
    FactoryGirl.define do
      factory :user do
        username "john"
      end
    end
  end
  
  before do
    @relationship = Relationship.new(follower_id: create(:user).id,
                                     followed_id: create(:user).id)
  end

  it "should be valid" do
    assert @relationship.valid?
  end

  it "should require a follower_id" do
    @relationship.follower_id = nil
    refute @relationship.valid?
  end

  it "should require a followed_id" do
    @relationship.followed_id = nil
    refute @relationship.valid?
  end
end
