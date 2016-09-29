class UsersController < ApplicationController
	before_action :authenticate_user!, only: [:show]

	def show
		@user = User.find_by(id: params[:user_id])

		@users = current_user

		now = DateTime.now.to_date
		wedding_date = current_user.wedding_date
		@count = (wedding_date - now).to_i

		@images = Image.where(user_id: current_user.id)
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

	def update
		@user = current_user

		if params[:images]
	        #===== The magic is here ;)
	        params[:images].each { |image|
	        	p image
		        i = @user.images.create(image: image)
		        p i
		        p i.image
	        }
      	end

		if @user.update({})

			flash[:notice] = "photo successfully uploaded!"
			redirect_to user_path(@user)
			
		else
			flash[:alert] = "Please try again"
			render :show 
		end 
	end 
end
