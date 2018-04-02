RSpec.describe Subtask, type: :model do

  let(:subtask) { create(:subtask) }

  describe "when create a Subtask" do

    it 'is valid with valid attibutes' do
      expect(subtask).to be_valid
    end

    it "is not valid without a description" do
      subtask.description = nil
      expect(subtask).to_not be_valid
    end

    it "is not valid without a status" do
      subtask.status = nil
      expect(subtask).to_not be_valid
    end

    it "is not valid without a List" do
      subtask.task = nil
      expect(subtask).to_not be_valid
    end

  end

end
