class AddLanguageToRepositories < ActiveRecord::Migration[5.0]
  def change
    add_column :repositories, :language, :string
  end
end
