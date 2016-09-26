class ExpensesController < ApplicationController
	before_action :authenticate_user!, only: [:index, :show]

	def index
		@user = current_user
		@expenses = current_user.expenses
		@expense = Expense.new

	end 

	def new
		@user = current_user
		@expense = Expense.new
	end

	def create
		@user = current_user
		@expense = Expense.new(expense_params)
		@expense.user_id = @user.id

		if @expense.save
			flash[:notice] = "expense successfully created!"
			redirect_to user_expenses_path(@user)
		else
			flash[:alert] = "Please fill text fields with characters"
			render :new
		end 
	end

	def edit
		@user = current_user
		@expense = Expense.find(params[:id])
	end

	def update
		@user = current_user
		@expense = Expense.find(params[:id])
		@expense.user_id = @user.id

		if @expense.update(expense_params)
			flash[:notice] = "expense successfully updated!"
			redirect_to user_expenses_path
		else
			flash[:alert] = "Please fill text fields with characters"
			render :edit
		end
	end

	def destroy
		user = current_user
		expense = Expense.find(params[:id])
		if expense.destroy
			flash[:notice] = "checklist deleted"
			redirect_to user_expenses_path
		end
	end
	
	private

	def expense_params
		params.require(:expense).permit(:name, :description, :category, :payer, :cost)
		
	end

end
