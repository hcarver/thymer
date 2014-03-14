class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :name
      t.integer :project_id
      t.string :slug
      t.integer :estimated_minutes

      t.timestamps
    end

    add_index :tasks, [:project_id, :name], unique: true
    add_index :tasks, :slug, unique: true
  end
end
