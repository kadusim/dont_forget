class List < ApplicationRecord
  belongs_to :user
  has_many :task
  accepts_nested_attributes_for :task,
    :allow_destroy => true,
    :reject_if     => :all_blank

  enum type_access: %i[shared_all private_me]
  enum status: %i[pend done]

  validates_presence_of :name, :type_access, :status, :user
end
