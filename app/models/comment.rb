class Comment < ApplicationRecord
  belongs_to :review

  validates :commenter, presence: true
  validates :comment, presence: true
end
