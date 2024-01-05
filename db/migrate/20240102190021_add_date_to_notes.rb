class AddDateToNotes < ActiveRecord::Migration[7.1]
  def change
    add_column :notes, :date, :timestamp
  end
end
