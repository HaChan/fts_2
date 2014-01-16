class TestingAnswer < ActiveRecord::Base
	belongs_to :answer
	scope :find_answer_choice, lambda { |answer_id| 
		        where( answer_id: "#{answer_id}" ) }
end
