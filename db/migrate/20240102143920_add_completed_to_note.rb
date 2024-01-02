class AddCompletedToNote < ActiveRecord::Migration[7.1]
  def change
    add_column :notes, :completed, :boolean, default: false
  end
end
