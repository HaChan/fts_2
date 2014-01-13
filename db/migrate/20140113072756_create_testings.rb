class CreateTestings < ActiveRecord::Migration
  def change
    create_table :testings do |t|
      t.integer :examination_id
      t.integer :user_id
      t.integer :result
      t.timestamps
    end
  end
end
