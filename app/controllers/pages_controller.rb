class PagesController < ApplicationController

	def home
		@highly_rated_reviews = Review.where("score >= ?", 8).order("score DESC").limit(5)
		@recent_reviews = Review.order("created_at DESC").limit(5)
		@featured_reviews = Review.where(is_featured: true)
	end

	def about
		@content = Page.find_by(url: 'about')
	end

	def terms_and_conditions	  
		@content = Page.find_by(url: 'terms-and-conditions')
	end
end
