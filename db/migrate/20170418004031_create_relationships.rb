class CreateRelationships < ActiveRecord::Migration[5.0]
  def change
    add_index :relationships, %i(follower_id followed_id), unique: true
  end
end
