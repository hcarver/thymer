class CreateClients < ActiveRecord::Migration
  def change
    create_table :clients do |t|
      t.string :name
      t.string :slug
      t.integer :user_id

      t.timestamps
    end
    add_index :clients, :name, unique: true
    add_index :clients, :slug, unique: true
  end
end
