class AddJournalistToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :journalist, :boolean, default: false
  end
end
