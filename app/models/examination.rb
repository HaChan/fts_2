class Examination < ActiveRecord::Base
	belongs_to :subject
	has_many :examination_questions
	has_many :users
	has_many :testings
	validates :exam_type, presence: true

	def public?
		1 == self.exam_type
	end

	def using?
		self.testings.any?
	end
end
