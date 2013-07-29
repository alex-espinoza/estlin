class ChangeTweetTable < ActiveRecord::Migration
  def up
  	change_column :tweets, :text, :text, :null => false
  	add_column :tweets, :scheduled_time, :datetime, :null => false
  	add_column :tweets, :was_tweeted, :boolean, :null => false, :default => false
  end

  def down
  	change_column :tweets, :text, :string
  	remove_column :tweets, :scheduled_time
  	remove_column :tweets, :was_tweeted
  end
end
