class UpdateSubsIdTypeInUser < ActiveRecord::Migration[6.0]
  def change
    change_column :users, :subsId, :string
  end
end
