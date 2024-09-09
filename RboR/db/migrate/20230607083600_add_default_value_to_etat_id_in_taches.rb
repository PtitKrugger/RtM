class AddDefaultValueToEtatIdInTaches < ActiveRecord::Migration[7.0]
  def change
    change_column_default :taches, :etat_id, from: nil, to: 2
  end
end
