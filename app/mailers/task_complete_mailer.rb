class TaskCompleteMailer < ApplicationMailer
	default from: "hello@beloved.co"
	def taskcomplete_email(user)
		@user = user
		mail(to: @user.email, subject: "Dang, #{@user.name}! One huge task done!")

	end
end
