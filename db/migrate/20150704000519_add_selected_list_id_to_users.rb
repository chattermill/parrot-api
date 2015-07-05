class AddSelectedListIdToUsers < ActiveRecord::Migration
  def change
    add_column :users, :selectedListId, :string
  end
end
