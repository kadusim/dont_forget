class Subtask < ApplicationRecord
  belongs_to :task

  enum status: %i[task_pend task_done]

  validates_presence_of :description, :status, :task

  before_validation     :load_defaults

  def load_defaults
    if self.new_record?
      self.status      = :task_pend
    end
  end
end
