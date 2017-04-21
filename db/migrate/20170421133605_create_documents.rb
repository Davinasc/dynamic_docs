class CreateDocuments < ActiveRecord::Migration[5.0]
  def change
    create_table :documents do |t|
      t.references :template, foreign_key: true
      t.json :campos

      t.timestamps
    end
  end
end
