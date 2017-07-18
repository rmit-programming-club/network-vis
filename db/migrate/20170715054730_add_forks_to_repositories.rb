class AddForksToRepositories < ActiveRecord::Migration[5.0]
  def change
    add_column :repositories, :forks, :integer
  end
end
