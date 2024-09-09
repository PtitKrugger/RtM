class RemoveTacheIdInImportances < ActiveRecord::Migration[7.0]
  def change
    remove_column :importances, :tache_id
  end
end
