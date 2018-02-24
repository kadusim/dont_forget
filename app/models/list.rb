class List < ApplicationRecord
  belongs_to :user
  enum type_access: %i[shared_all private_me]
  enum status: %i[open done]

  validates_presence_of :name, :type_access, :status, :user
end
