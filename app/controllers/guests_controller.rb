class GuestsController < ApplicationController
	before_action :authenticate_user!, only: [:index, :show]

	def index
		@user = current_user
		@guests = current_user.guests 
		@guest = Guest.new 
	end

	def new
		@user = current_user
		@guest = Guest.new
	end

	def create
		@user = current_user
		@guest = Guest.new(guest_params)
		@guest.user_id = @user.id 

		if @guest.save
			flash[:notice] = "guest has been saved!"
			redirect_to user_guests_path(@user)
		else
			flash[:alert] = "Please fill text fields with characters"
			render :new 
		end
	end

	def edit
		@user = current_user
		@guest = Guest.find(params[:id])
	end 

	def update
		@user = current_user
		@guest = Guest.find(params[:id])
		@guest.user_id = @user.id 

		if @guest.update(guest_params)
			flash[:notice] = "guest successfully updated!"
			redirect_to user_guests_path
		else
			flash[:alert] = "Please fill text fields with characters"
			render :edit 
		end 
	end

	def destroy 
		user = current_user
		guest = Guest.find(params[:id])
		if guest.destroy
			flash[:notice] = "guest deleted"
			redirect_to user_guests_path
		end
	end 

	private
	def guest_params
		params.require(:guest).permit(
			:first_name, :last_name, 
			:phone_number, :address
			)
		
	end
end
