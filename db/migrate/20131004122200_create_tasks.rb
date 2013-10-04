class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :content
      t.integer :position
      t.integer :complete
      t.timestamps
    end
  end
end
