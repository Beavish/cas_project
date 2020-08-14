class AddGenreToPosts < ActiveRecord::Migration[6.0]
  def change
    add_column :posts, :Genre, :string
  end
end
