class AddTextoToTemplate < ActiveRecord::Migration[5.0]
  def change
    add_column :templates, :texto, :text
  end
end
