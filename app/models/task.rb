class Task < ApplicationRecord
	belongs_to :checklist

	def completed?
		!completed_at.blank?
	end
end
