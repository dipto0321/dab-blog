class RemoveColumnsFromPost < ActiveRecord::Migration[5.2]
  def change
    remove_column :posts, :title, :string
    remove_column :posts, :tag, :string
  end
end
