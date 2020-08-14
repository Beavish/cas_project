class AddPublicToPosts < ActiveRecord::Migration[6.0]
  def change
    add_column :posts, :public, :boolean
  end
end
