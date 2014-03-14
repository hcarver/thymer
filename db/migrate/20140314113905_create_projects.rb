class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :name
      t.integer :client_id
      t.string :slug

      t.timestamps
    end

    add_index :projects, [:client_id, :name], unique: true
    add_index :projects, :slug, unique: true
  end
end
