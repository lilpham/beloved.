class ChecklistsController < ApplicationController
	before_action :authenticate_user!, only: [:index]

	def index
		@checklists = current_user.checklists
		@user = current_user
		@checklist = Checklist.new
		@task = Task.new

		@checklist = Checklist.find_by(user_id: current_user.id)

	end 

	def new
		@user = current_user
		@checklist = Checklist.new
	end 
	
	def create
		@user = current_user
		@checklist = Checklist.new(checklist_params)
		@checklist.user_id = @user.id
			

		if @checklist.save
			flash[:notice] = "checklist successfully created!"
			redirect_to ("/users/#{@user.id}/checklists/#{@checklist.id}")
		else
			flash[:alert] = "Please fill text fields with characters"
			render :new
		end 
	end

	def show
		@user = current_user
		@checklist = Checklist.find(params[:id])
		@tasks = @checklist.tasks

		@task = Task.new
	end 

	def edit
		@user = current_user
		@checklist = Checklist.find(params[:id])
	end

	def update
		@user = current_user
		@checklist = Checklist.find(params[:id])
		@checklist.user_id = @user.id

		if @checklist.update(checklist_params)
			flash[:notice] = "checklist successfully updated!"
			redirect_to user_checklists_path
		else
			flash[:alert] = "Please fill text fields with characters"
			render :edit
		end

	end

	def destroy
		user = current_user
		checklist = Checklist.find(params[:id])
		if checklist.destroy
			flash[:notice] = "checklist deleted"
			redirect_to user_checklists_path

		end
	end

	private
	def checklist_params
		params.require(:checklist).permit(
		:title, :description, :user_id
		)
	end
end
