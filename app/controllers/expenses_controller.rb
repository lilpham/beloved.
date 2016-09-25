class ExpensesController < ApplicationController
	before_action :authenticate_user!, only: [:index, :show]

	def index
		render :index
	end 

end
