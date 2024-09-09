class AddTableImportance < ActiveRecord::Migration[7.0]
  def change
    create_table :importances do |t|
      t.string :descriptif
      t.string :codeCouleur

      t.timestamps
    end
  end
end
