class Task < ApplicationRecord
	belongs_to :checklist

	validates :name, :deadline, presence: true 

	after_create :reminder


	@@REMINDER_TIME = 1.day


	def reminder 
    @user =  User.find(self.checklist.user_id)
    @twilio_number = ENV['TWILIO_NUMBER']
    @client = Twilio::REST::Client.new ENV['TWILIO_ACCOUNT_SID'], ENV['TWILIO_AUTH_TOKEN']
    time_str = ((self.deadline)).strftime("%I:%M%p on %b. %d, %Y")
    reminder = "Hi! Just a reminder that you have a deadline coming up at #{time_str}. Don't forget: #{self.name}. Keep up the good work!"
    message = @client.account.messages.create(
      :From => "6159051581",
      :To => @user.phone_number,
      :Body => reminder,
    )
    puts message.to
  end

  def when_to_run
    deadline - @@REMINDER_TIME
  end
	
	def completed?
		!completed_at.blank?
	end

  # handle_asynchronously :reminder, :run_at => Proc.new { |i| i.when_to_run }
end
