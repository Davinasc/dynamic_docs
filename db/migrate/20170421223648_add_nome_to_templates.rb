class AddNomeToTemplates < ActiveRecord::Migration[5.0]
  def change
    add_column :templates, :nome, :string
  end
end
