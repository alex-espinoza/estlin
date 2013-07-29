class AddUserIdAssociationColumn < ActiveRecord::Migration
  def up
  	add_column :tweets, :user_id, :integer
  end

  def down
  	remove_column :tweets, :user_id
  end
end
