class ChangeDefaultIsDoneToFalse < ActiveRecord::Migration
  def change
    change_column :mentee_surveys, :is_done, :boolean, default: false
  end
end
