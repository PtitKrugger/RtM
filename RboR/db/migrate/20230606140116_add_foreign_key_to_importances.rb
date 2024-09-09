class AddForeignKeyToImportances < ActiveRecord::Migration[7.0]
  def change
    add_column :importances, :tache_id, :integer
    add_foreign_key :importances, :taches, column: :tache_id
  end
end
