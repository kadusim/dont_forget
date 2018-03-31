class Task < ApplicationRecord
  belongs_to :list

  enum status: %i[task_pend task_done]

  has_many :child, class_name: "Task",
                  foreign_key: "father_id"
  accepts_nested_attributes_for :child

  belongs_to :father, class_name: "Task", optional: true

  validates_presence_of :description, :status, :list
end
