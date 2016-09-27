class UsersController < ApplicationController
	before_action :authenticate_user!, only: [:show]

	def show
		@user = User.find_by(id: params[:user_id])

		
		now = DateTime.now.to_date
		wedding_date = current_user.wedding_date
		@count = (wedding_date - now).to_i
		

	end 

	def treat
		render :treat
	end 

	def c
		render :c
	end 

	def settings
		render :settings
	end 

	def account
		@user = current_user
		
	end


end
