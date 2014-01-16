class Testing < ActiveRecord::Base
	before_update :evaluate

	belongs_to :user
	belongs_to :examination
	has_many :testing_questions
	has_many :testing_answers

	accepts_nested_attributes_for :testing_questions

	def evaluate
		result1 = 0 
		self.testing_questions.each do |testing_question|
			result1 += 1 if 1 == testing_question.correct
		end
		self.result = result1
	end

	def evaluated?
		!self.result.nil?
	end

	def evaluate_auto
		self.testing_questions.each do |testing_question|
			unless testing_question.question.type_question_text?
				check = false
				testing_question.testing_answers.each do |testing_answer|
					check = testing_answer.answer.correct?
					break unless check
				end
				if check
					testing_question.correct = 1
					seft.result += 1
				else
					testing_question.correct = 0
				end
			end
		end
		self.result = 0 unless self.evaluated?
		self.save!
	end

end
