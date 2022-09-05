class CreateTasks < ActiveRecord::Migration[5.0]
  def change
    create_table :tasks do |t|
      t.string :title
      t.text :description
      t.date :start
      t.date :finish
      t.boolean :allday

      t.timestamps
    end
  end
end
