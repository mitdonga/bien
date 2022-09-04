class PagesController < ApplicationController

	def about
		@content = Page.find_by(url: 'about')
	end

	def terms_and_conditions	  
		@content = Page.find_by(url: 'terms-and-conditions')
	end
end
