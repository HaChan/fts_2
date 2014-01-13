class CreateExaminations < ActiveRecord::Migration
  def change
    create_table :examinations do |t|
      t.integer :subject_id
      t.integer :duration
      t.integer :number_question
      t.datetime :datetime_exam
      t.integer :exam_type
      t.timestamps
    end
  end
end
