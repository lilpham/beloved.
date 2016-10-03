class WeddingdayMailer < ApplicationMailer
	default from: "hello@beloved.co"
	def wedding_email(user)
		@user = user
		mail(to: @user.email, subject: "The day has finally come, #{@user.name}!")
	end

end
