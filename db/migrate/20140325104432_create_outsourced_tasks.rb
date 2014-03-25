class CreateOutsourcedTasks < ActiveRecord::Migration
  def change
    create_table :outsourced_tasks do |t|
      t.string :name
      t.integer :project_id
      t.string :slug

      t.money :estimated_cost, currency: { present: false }
      t.money :actual_cost, currency: { present: false }, amount: { null: true, default: nil }
      t.money :charged_to_client, currency: { present: false }

      t.timestamps
    end

    add_index :outsourced_tasks, [:project_id, :name], unique: true
    add_index :outsourced_tasks, :slug, unique: true
  end
end
