class AddTextoToDocuments < ActiveRecord::Migration[5.0]
  def change
    add_column :documents, :texto, :text
  end
end
