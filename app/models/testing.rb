class Testing < ActiveRecord::Base
	belongs_to :user
	belongs_to :examination
	has_many :testing_questions
	has_many :testing_answers

end
