class ChangeUserColumnNames < ActiveRecord::Migration
  def up
  	rename_column :users, :screen_name, :nickname
  	rename_column :users, :id_str, :uid
  end

  def down
  	rename_column :users, :nickname, :screen_name
  	rename_column :users, :uid, :id_str
  end
end
