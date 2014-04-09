class AddRateAndQuoteToProject < ActiveRecord::Migration
  def change
    add_column :projects, :rate, :money, currency: { present: false }
    add_column :projects, :quote, :money, currency: { present: false }
  end
end
