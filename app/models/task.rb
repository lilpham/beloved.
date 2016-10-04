class Task < ApplicationRecord
	belongs_to :checklist

	validates :name, :deadline, presence: true 

	after_create :reminder


	@@REMINDER_TIME = 1.days


	def reminder 
    @twilio_number = ENV['TWILIO_NUMBER']
    @client = Twilio::REST::Client.new ENV['TWILIO_ACCOUNT_SID'], ENV['TWILIO_AUTH_TOKEN']
    time_str = ((self.deadline).localtime).strftime("%I:%M%p on %b. %d, %Y")
    reminder = "Hi #{self.name}. Just a reminder that you have an appointment coming up at #{time_str}."
    message = @client.account.messages.create(
      :from => @twilio_number,
      :to => current_user.phone_number,
      :body => reminder,
    )
    puts message.to
  end

  def when_to_run
    deadline - @@REMINDER_TIME
  end
	
	def completed?
		!completed_at.blank?
	end

  handle_asynchronously :reminder, :run_at => Proc.new { |i| i.when_to_run }
end
