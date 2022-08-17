class Review < ApplicationRecord
   validates :title, presence: true, length: { minimum: 10 }
   validates :body, presence: true, length: { minimum: 20 }
   validates :score, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0, less_than_or_equal_to: 10 }

   def to_param
      id.to_s + "-" + title.parameterize
   end

end
