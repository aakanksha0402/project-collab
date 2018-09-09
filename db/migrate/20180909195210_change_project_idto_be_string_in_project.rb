class ChangeProjectIdtoBeStringInProject < ActiveRecord::Migration[5.1]
  def change
    change_column :projects, :project_id, :string
  end
end
