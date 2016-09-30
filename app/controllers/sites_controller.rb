class SitesController < ApplicationController

	def home
		if user_signed_in?
			redirect_to user_path(current_user.name)
		end
	end

	def about
		render :about 
	end

	def plan
		render :plan 
	end

	def treat
		render :treat 
	end

	def blog
		render :blog 
	end
	
	def contact
		render :contact
	end
	
	def set_time_zone
		p "test"
	end
end
