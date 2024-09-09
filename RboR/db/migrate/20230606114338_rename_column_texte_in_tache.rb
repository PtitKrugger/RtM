class RenameColumnTexteInTache < ActiveRecord::Migration[7.0]
  def change
    rename_column :taches, :texte, :descriptif
  end
end
