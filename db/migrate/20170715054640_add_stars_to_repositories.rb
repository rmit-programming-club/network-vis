class AddStarsToRepositories < ActiveRecord::Migration[5.0]
  def change
    add_column :repositories, :stars, :integer
  end
end
