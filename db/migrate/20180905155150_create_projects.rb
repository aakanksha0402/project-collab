class CreateProjects < ActiveRecord::Migration[5.1]
  def change
    create_table :projects do |t|
      t.string :name
      t.integer :project_id
      t.string :status
      t.references :added_by

      t.timestamps
    end
  end
end
