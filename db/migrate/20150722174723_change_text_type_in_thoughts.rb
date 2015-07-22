class ChangeTextTypeInThoughts < ActiveRecord::Migration
  def up
  		change_column :thoughts, :text, :text
  end

  def down
  		change_column :thoughts, :text, :string
  	end
end
