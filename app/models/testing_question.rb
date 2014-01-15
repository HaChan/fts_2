class TestingQuestion < ActiveRecord::Base
	belongs_to :question
	has_many :testing_answers
end
