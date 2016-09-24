class SitesController < ApplicationController
	def home
		@user = User.find_by(id: params[:id])
		render :home 
	end
end
