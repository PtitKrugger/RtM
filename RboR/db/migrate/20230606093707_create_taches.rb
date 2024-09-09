class CreateTaches < ActiveRecord::Migration[7.0]
  def change
    create_table :taches do |t|
      t.string :texte

      t.timestamps
    end
  end
end
