require 'rails_helper'

RSpec.describe List, type: :model do

  let(:list) { create(:list) }

  it 'is valid with valid attibutes' do
    expect(list).to be_valid
  end

  it "is not valid without a name" do
    list.name = nil
    expect(list).to_not be_valid
  end

  it "is not valid without a type_access" do
    list.type_access = nil
    expect(list).to_not be_valid
  end

  it "is not valid without a status" do
    list.status = nil
    expect(list).to_not be_valid
  end

  it "is not valid without a User" do
    list.user = nil
    expect(list).to_not be_valid
  end

  it "has_many List" do
    assc = described_class.reflect_on_association(:task)
    expect(assc.macro).to eq :has_many
  end

  it "belongs to User" do
    assc = described_class.reflect_on_association(:user)
    expect(assc.macro).to eq :belongs_to
  end

end
