class Answer < ActiveRecord::Base
  belongs_to :question

  def correct?
  	1 == self.status
  end
  
end
