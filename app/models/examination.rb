class Examination < ActiveRecord::Base
	belongs_to :subject
	has_many :examination_questions
	has_many :users
	validates :exam_type, presence: true

	def exam_public?
		1 === self.exam_type
	end
end
