class CreateTestingAnswers < ActiveRecord::Migration
  def change
    create_table :testing_answers do |t|
      t.integer :answer_id
      t.integer :testing_id
      t.string  :answer_text
      t.integer :integer
      t.timestamps
    end
  end
end
