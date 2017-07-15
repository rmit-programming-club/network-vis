class DropOrgRepositoriesTable < ActiveRecord::Migration[5.0]
  def change
    drop_table :org_repositories
  end
end
