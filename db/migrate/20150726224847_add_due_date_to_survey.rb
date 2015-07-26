class AddDueDateToSurvey < ActiveRecord::Migration
  def change
    add_column :surveys, :due_date, :date
  end
end
