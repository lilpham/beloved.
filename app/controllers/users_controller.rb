class UsersController < ApplicationController
	before_action :authenticate_user!, only: [:show]

	def show
		@user = current_user

		now = DateTime.now.to_date
		wedding_date = current_user.wedding_date
		@count = (wedding_date - now).to_i

		@images = Image.where(user_id: current_user.id)

		@checklists = current_user.checklists

		@checklist = current_user.checklists.find_by(title: "This Week")
		@monthchecklist = current_user.checklists.find_by(title: Date.today.strftime("%B"))

		Checklist.find_by(user_id: current_user.id)
		@task = Task.new

		@meetings = Meeting.all
		@meeting = Meeting.new

		

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
		        i = @user.images.create(image: image)
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
