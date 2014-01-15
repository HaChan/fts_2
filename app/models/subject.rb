class Subject < ActiveRecord::Base
  has_many :questions
  validates :subject_name, uniqueness: true
end
