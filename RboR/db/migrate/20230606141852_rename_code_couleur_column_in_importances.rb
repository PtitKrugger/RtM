class RenameCodeCouleurColumnInImportances < ActiveRecord::Migration[7.0]
  def change
      rename_column :importances, :codeCouleur, :codecouleur
  end
end
