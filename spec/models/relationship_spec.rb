require 'rails_helper'

RSpec.describe Relationship, type: :model do
  
  before do
    @user           = FactoryBot.create(:user)
    @followed_user = FactoryBot.create(:user, name: "followed user")
    @relationship   = FactoryBot.build(:relationship,
                        follower_id: @user.id,
                        followed_id: @followed_user.id)
  end
  
  it "should valid factory" do
    expect(@relationship).to be_valid
  end
  
  it "should be invalid without follower_id" do
    relationship_without_follower_id = FactoryBot.build(:relationship,
                                                        followed_id: @followed_user.id)
    relationship_without_follower_id.valid?
    expect(relationship_without_follower_id.errors[:follower_id]).to include("can't be blank")
  end
  
  it "should be invalid without followed_id" do
    relationship_without_followed_id = FactoryBot.build(:relationship,
                                              follower_id: @user.id)
    relationship_without_followed_id.valid?
    expect(relationship_without_followed_id.errors[:followed_id]).to include("can't be blank")
  end
  
  it "should be invalid with ununiqueness combination of follower_id and followed_id" do
    @relationship.save
    ununiqueness_relationship = FactoryBot.build(:relationship,
                                                follower_id: @user.id,
                                                followed_id: @followed_user.id)
    ununiqueness_relationship.valid?
    expect(ununiqueness_relationship.errors[:follower_id]).to include("has already been taken")
    expect(ununiqueness_relationship.errors[:followed_id]).to include("has already been taken")
  end
  
end
