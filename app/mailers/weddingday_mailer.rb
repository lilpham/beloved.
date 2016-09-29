class WeddingdayMailer < ApplicationMailer
	default from: "hello@beloved.co"
	def wedding_email(user)
		@user = user
		mail(to: @user.email, subject: "The day has finally come, #{@user.name}!")
	end

		if Date.now == @user.wedding_date
			WeddingdayMailer.wedding_email(current_user).deliver_later
		end
end
