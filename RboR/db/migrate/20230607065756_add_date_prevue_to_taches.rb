class AddDatePrevueToTaches < ActiveRecord::Migration[7.0]
  def change
    add_column :taches, :date_prevue, :datetime
  end
end
