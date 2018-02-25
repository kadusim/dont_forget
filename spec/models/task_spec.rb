require 'rails_helper'

RSpec.describe Task, type: :model do

  let(:task) { create(:task) }
  let(:task_child) { create(:task_child) }

  describe "when create a Task Father" do

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

  describe "when create a Task Child" do

    it 'is valid with valid attibutes' do
      expect(task_child).to be_valid
    end

    it "is not valid without a description" do
      task_child.description = nil
      expect(task_child).to_not be_valid
    end

    it "is not valid without a status" do
      task_child.status = nil
      expect(task_child).to_not be_valid
    end

    it "is not valid without a List" do
      task_child.list = nil
      expect(task_child).to_not be_valid
    end

    it "has_many child" do
      assc = described_class.reflect_on_association(:child)
      expect(assc.macro).to eq :has_many
    end

    it "belongs to father" do
      assc = described_class.reflect_on_association(:father)
      expect(assc.macro).to eq :belongs_to
    end

  end

end
