class CreateEtats < ActiveRecord::Migration[7.0]
  def change
    create_table :etats do |t|
      t.string :etat

      t.timestamps
    end

    add_column :taches, :etat_id, :integer
    add_foreign_key :taches, :etats, column: :etat_id
  end
end
