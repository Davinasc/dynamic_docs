class AddTipoToTemplate < ActiveRecord::Migration[5.0]
  def change
    add_reference :templates, :type, foreign_key: true
  end
end
