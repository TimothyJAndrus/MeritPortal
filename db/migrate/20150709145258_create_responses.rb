class CreateResponses < ActiveRecord::Migration
  def change
    create_table :responses do |t|
      t.integer :survey_id
      t.integer :question_id
      t.text :response_text
      t.integer :response_range
      t.integer :mentee_id

      t.timestamps null: false
    end
  end
end
