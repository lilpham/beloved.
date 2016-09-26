class TasksController < ApplicationController
	before_action :authenticate_user!, only: [:index, :show]
	before_action :set_checklist

	def index		
		render :index
	end 

	def create

	end
	
	def new

	end	

	def edit

	end

	def update
		
	end

	def destroy
		
	end
end
