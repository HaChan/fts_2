class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.integer :question_id
      t.string :answer_content
      t.integer :status
      t.string :true_content
      t.integer :type
      t.timestamps
    end
  end
end
