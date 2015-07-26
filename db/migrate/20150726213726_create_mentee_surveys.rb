class CreateMenteeSurveys < ActiveRecord::Migration
  def change
    create_table :mentee_surveys do |t|
      t.integer :mentee_id
      t.integer :survey_id

      t.timestamps null: false
    end
  end
end
