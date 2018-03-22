require 'rails_helper'

RSpec.describe Favorite, type: :model do

  let(:user) { create(:user) }
  let(:list) { create(:list) }

  let(:favorite) { Favorite.new(user_follower_id: user.id, list_followed_id: list.id) }

  it 'is valid with valid attibutes' do
    expect(favorite).to be_valid
  end

  it "is not valid without a user id" do
    favorite.user_follower_id = nil
    expect(favorite).to_not be_valid
  end

  it "is not valid without a list id" do
    favorite.list_followed_id = nil
    expect(favorite).to_not be_valid
  end

end
