class List < ApplicationRecord
  belongs_to :user
  has_many :tasks, dependent: :destroy

  accepts_nested_attributes_for :tasks,
    :allow_destroy => true,
    reject_if: proc { |attributes| attributes['description'].blank? }

  enum type_access: %i[list_shared list_private]
  enum status: %i[list_pend list_done]

  validates_presence_of :name, :type_access, :status, :user

  scope :lists_pend, -> { where(status: :list_pend) }
end
