class UsersController < ApplicationController
	before_action :authenticate_user!, only: [:show]

	def show
		render :show
	end 

	def treat
		render :treat
	end 

	def create
		render :create
	end 

	def settings
		render :settings
	end 

	def account
		render :account
	end


end
