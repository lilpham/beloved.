class TasksController < ApplicationController
	before_action :authenticate_user!, only: [:index, :show]

	def new
		@user = current_user
		@checklist = Checklist.find(params[:checklist_id])

		@task = Task.new
	end	
	
	def create
		@user = current_user
		@checklist = Checklist.find(params[:checklist_id])
		@task = Task.new(task_params)
		@task.user_id = @user.id
		@task.checklist_id = @checklist.id
			
		if @task.save
			flash[:notice] = "task successfully created!"
			redirect_to ("/users/#{@user.id}/checklists/#{@checklist.id}")
		else
			flash[:alert] = "Please fill text fields with characters"
			render :new
		end 
	end

	def edit
		@user = current_user
		@checklist = Checklist.find(params[:checklist_id])
		@task = Task.find(params[:id])

	end

	def update
		@user = current_user
		@checklist = Checklist.find(params[:checklist_id])
		@task = Task.find(params[:id])
		@task.user_id = @user.id
		@task.checklist_id = @checklist.id

		if @task.update(task_params)
			flash[:notice] = "task successfully updated!"
			redirect_to user_checklist_path(@user, @checklist)
		else
			flash[:alert] = "Please fill text fields with characters"
			render :edit
		end
	end

	def destroy
		@user = current_user
		@checklist = Checklist.find(params[:checklist_id])
		task = Task.find(params[:id])

		if task.destroy
			flash[:notice] = "task deleted"
			redirect_to user_checklist_path(@user, @checklist)
		end
	end

	private
	def task_params
		params.require(:task).permit(:name, :description, :deadline, :checklist_id, :user_id)
	end
end
