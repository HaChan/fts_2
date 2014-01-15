class CreateExaminationQuestions < ActiveRecord::Migration
  def change
    create_table :testing_questions do |t|
      t.integer :testing_id
      t.integer :question_id
      t.timestamps
    end
  end
end
