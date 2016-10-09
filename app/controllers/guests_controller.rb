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
		if user_signed_in?
			@user = current_user
		else
			@user = User.find(params[:user_id])
		end

		@guest = Guest.new(guest_params)
		@guest.user_id = @user.id 


		if @guest.save
			flash[:notice] = "guest has been saved!"

			if user_signed_in?
				redirect_to :back
			else
				redirect_to user_thankyou_path(@user)
			end
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
			redirect_to :back
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
			redirect_to :back
		end
	end 

	def guest_input_form
		@user = User.find(params[:user_id])
		@guest = Guest.new 

		flash[:alert] = "Please fill text fields with characters"
		render :guest_input_form 

	end 

	def thankyou
		@user = User.find(params[:user_id])
		render :thankyou
	end

	private
	def guest_params
		params.require(:guest).permit(
			:first_name, :last_name, 
			:phone_number, :address_1,
			:address_2, :city, :state,
			:zipcode, :party_name,
			)
		
	end

end
