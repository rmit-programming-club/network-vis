class CreateRepositoryModel < ActiveRecord::Migration[5.0]
  def change
    create_table :repositories do |t|
      t.string :name
      t.string :url
      t.references :owner, polymorphic: true, index: true
    end
  end
end
