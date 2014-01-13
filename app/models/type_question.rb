class TypeQuestion < ActiveRecord::Base

  def checked? type_question
    type_question == self.id
  end
end
