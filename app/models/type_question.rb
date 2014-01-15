class TypeQuestion < ActiveRecord::Base
  has_many :questions
  def checked? type_question
    type_question == self.id
  end
end
