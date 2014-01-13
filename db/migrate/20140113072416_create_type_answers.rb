class CreateTypeAnswers < ActiveRecord::Migration
  def change
    create_table :type_answers do |t|
      t.integer :answer_id
      t.string :answer_type
      t.timestamps
    end
  end
end
