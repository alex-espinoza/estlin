class UpdateUserTableForTweeting < ActiveRecord::Migration
  def up
  	change_column :users, :nickname, :string, :null => false
  	change_column :users, :uid, :string, :null => false
  	add_column :users, :oauth_token, :string, :null => false
  	add_column :users, :oauth_secret, :string, :null => false
  end

  def down
  	change_column :users, :nickname, :string
  	change_column :users, :uid, :string
  	remove_column :users, :oauth_token
  	remove_column :users, :oauth_secret
  end
end
