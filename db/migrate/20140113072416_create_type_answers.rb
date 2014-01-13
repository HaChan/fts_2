class CreateTypeAnswers < ActiveRecord::Migration
  def change
    create_table :type_questions do |t|
      t.string :question_type
      t.timestamps
    end
  end
end
