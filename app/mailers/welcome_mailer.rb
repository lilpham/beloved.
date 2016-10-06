class WelcomeMailer < ApplicationMailer
	default from: "hello@belovedapp.co"
	def welcome_email(user)
		@user = user
		mail(to: @user.email, subject: "Welcome, #{@user.name}!")

	end
end