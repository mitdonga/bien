class Comment < ApplicationRecord
  belongs_to :review
  belongs_to :user

  validates :commenter, presence: true
  validates :comment, presence: true
end
