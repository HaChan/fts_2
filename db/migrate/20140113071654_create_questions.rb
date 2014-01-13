class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.integer :subject_id
      t.string :subject_content
      t.integer :type_question_id
      t.timestamps
    end
  end
end
