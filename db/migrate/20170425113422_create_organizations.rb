class CreateOrganizations < ActiveRecord::Migration[5.0]
  def change
    create_table :organizations do |t|
      t.string :url
      t.string :public_members

      t.timestamps
    end
  end
end
