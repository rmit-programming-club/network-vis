class AddFieldnameNameToOrganization < ActiveRecord::Migration[5.0]
  def change
    add_column :organizations, :name, :string
  end
end
