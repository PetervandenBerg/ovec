class AddShowcaseToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :showcase, :boolean
  end
end
