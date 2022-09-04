class AddReviewImageToReviewsTable < ActiveRecord::Migration[7.0]
  def change
    add_column :reviews, :review_image, :string
  end
end
