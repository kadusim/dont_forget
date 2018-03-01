class Follow < ApplicationRecord
  belongs_to :user
  belongs_to :list

  validates_uniqueness_of :list_id, scope: :user_id
  validates_presence_of :list_id, :user_id
end
