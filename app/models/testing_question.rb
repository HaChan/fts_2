class TestingQuestion < ActiveRecord::Base
	belongs_to :question
	has_many :testing_answers

	def correct?
		1 == self.correct
	end
end
