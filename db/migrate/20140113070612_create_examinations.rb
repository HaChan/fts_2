class CreateExaminations < ActiveRecord::Migration
  def change
    create_table :examinations do |t|
      t.integer :subject_id
      t.integer :duration
      t.integer :number_question
      t.tring :datetime_exam
      t.integer :type
      t.timestamps
    end
  end
end
