class CreateThoughts < ActiveRecord::Migration
  def change
    create_table :thoughts do |t|
      t.string :title
      t.string :text
      t.string :source

      t.timestamps null: false
    end
  end
end
