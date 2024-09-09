class AddForeignKeyToTaches < ActiveRecord::Migration[7.0]
  def change
    add_foreign_key :taches, :importances, column: :importance_id
  end
end
