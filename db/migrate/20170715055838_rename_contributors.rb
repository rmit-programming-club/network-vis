class RenameContributors < ActiveRecord::Migration[5.0]
  def change
    rename_table :contributors, :contributions
  end
end
