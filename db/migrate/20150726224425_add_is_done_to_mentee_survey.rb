class AddIsDoneToMenteeSurvey < ActiveRecord::Migration
  def change
    add_column :mentee_surveys, :is_done, :boolean
  end
end
