class AddDescriptionToProject < ActiveRecord::Migration[5.1]
  def change
    add_column :projects, :description, :text
    change_column :projects, :status, :integer, using: 'status::integer', default: 0
  end
end
