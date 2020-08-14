class AddSubsIdToUser < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :subsId, :string
  end
end
