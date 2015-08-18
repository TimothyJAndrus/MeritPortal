class AddApprovedToMentor < ActiveRecord::Migration
  def change
    add_column :mentors, :approved, :boolean
  end
end
