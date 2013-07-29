class ChangeUserIdColumnToNullFalse < ActiveRecord::Migration
  def up
  	remove_column :tweets, :user_id
  	add_column :tweets, :user_id, :integer, :null => false
  end

  def down
  	remove_column :tweets, :user_id
  	add_column :tweets, :user_id, :integer
  end
end
