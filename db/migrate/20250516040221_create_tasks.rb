class CreateTasks < ActiveRecord::Migration[8.0]
  def change
    create_table :tasks do |t|
      t.string :name
      t.date :duedate
      t.datetime :completed_at
      t.integer :priority
      t.references :project, null: false, foreign_key: true

      t.timestamps
    end
  end
end
