class Question < ActiveRecord::Base
  belongs_to :subject
  belongs_to :type_question
  has_many :answers
  accepts_nested_attributes_for :answers,
  reject_if: lambda { |params| params[:answer_content].blank? }, allow_destroy: true

  validates :subject_content, presence: true
end
