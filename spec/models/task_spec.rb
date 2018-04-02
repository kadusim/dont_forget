require 'rails_helper'

RSpec.describe Task, type: :model do

  let(:task) { create(:task) }

  describe "when create a Task" do

    it 'is valid with valid attibutes' do
      expect(task).to be_valid
    end

    it "is not valid without a description" do
      task.description = nil
      expect(task).to_not be_valid
    end

    it "is not valid without a status" do
      task.status = nil
      expect(task).to_not be_valid
    end

    it "is not valid without a List" do
      task.list = nil
      expect(task).to_not be_valid
    end

  end

end
