class CreateLogs < ActiveRecord::Migration
  def change
    create_table :logs do |t|
      t.text :notes
      t.integer :task_id
      t.integer :time_minutes
      t.date :log_date

      t.timestamps
    end

    add_index :logs, :task_id
  end
end
