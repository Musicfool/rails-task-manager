class AddDefaultToCompleted < ActiveRecord::Migration[7.1]
  def change
    change_column :tasks, :completed, :boolean, default: false
  end
end
