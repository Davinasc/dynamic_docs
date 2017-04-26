class AddNomeToDocument < ActiveRecord::Migration[5.0]
  def change
    add_column :documents, :nome, :string
  end
end
