class CreateOrgRepositories < ActiveRecord::Migration[5.0]
  def change
    create_table :org_repositories do |t|
      t.string :name
      t.string :url
      t.references :organization, foreign_key: true

      t.timestamps
    end
  end
end
