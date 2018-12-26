class CreateRelationships < ActiveRecord::Migration[5.2]
  def change
    create_table :relationships do |t|
      t.references :user, foreign_key: true
      t.integer :following_id
      t.integer :follower_id
      t.integer :friend_id

      t.timestamps
    end
  end
end
