class CreateEvents < ActiveRecord::Migration[5.0]
  def change
    create_table :events do |t|
      t.string :type
      t.references :repository, foreign_key: true
      t.references :user, foreign_key: true
      t.references :organization, foreign_key: true
      t.integer :gh_id
      t.boolean :public

      t.timestamps
    end
  end
end
