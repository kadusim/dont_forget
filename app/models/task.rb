class Task < ApplicationRecord
  belongs_to :list

  enum status: %i[task_pend task_done]

  has_many :subtasks, dependent: :destroy

  accepts_nested_attributes_for :subtasks,
                                :allow_destroy => true,
                                reject_if: proc { |attributes| attributes['description'].blank? }

  validates_presence_of :description, :status, :list

  before_validation     :load_defaults

  def load_defaults
    if self.new_record?
      self.status      = :task_pend
    end
  end
end
