require 'rails_helper'

RSpec.describe Follow, type: :model do

  let(:list_one) { create(:list) }
  let(:list_two) { create(:list) }
  let(:follow_one_two) { Follow.create(user_id: list_one.user_id, list_id: list_two.id ) }
  let(:follow_two_one) { Follow.create(user_id: list_two.user_id, list_id: list_one.id ) }

  let(:list_three) { create(:list) }
  let(:follow_three_one) { Follow.create(user_id: list_three.user_id, list_id: list_one.id ) }

  it 'is valid with valid attibutes' do
    expect(follow_one_two).to be_valid
    expect(follow_two_one).to be_valid
    expect(follow_three_one).to be_valid
  end

  it 'is not valid with duplicates key' do
    follow_ok = Follow.create(user_id: list_two.user_id, list_id: list_one.id )
    follow_dup = Follow.create(user_id: list_two.user_id, list_id: list_one.id )
    expect(follow_ok).to be_valid
    expect(follow_dup).to_not be_valid
  end

  it "is not valid without a user_id" do
    follow_one_two.user_id = nil
    expect(follow_one_two).to_not be_valid
  end

  it "is not valid without a list_id" do
    follow_one_two.list_id = nil
    expect(follow_one_two).to_not be_valid
  end

  it "belongs to List" do
    assc = described_class.reflect_on_association(:list)
    expect(assc.macro).to eq :belongs_to
  end

  it "belongs to User" do
    assc = described_class.reflect_on_association(:user)
    expect(assc.macro).to eq :belongs_to
  end

  after(:all) { Follow.destroy_all }

end
