class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :name, :fiance_name, :wedding_date, presence: true

  has_many :checklists
  has_many :guests
  has_many :expenses

  has_many :images, :dependent => :destroy 

  def total(category)
		sum = 0 
		self.expenses.each do |expense|
			if expense.category == category
			sum += expense.cost
			end 
		end
		sum
	end

	def grand_total
		sum = 0 
		self.expenses.each do |expense|
			sum += expense.cost
		end 
		sum
	end 


end

