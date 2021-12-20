class ChangeTasksNameNotNull < ActiveRecord::Migration[6.1]
  def change
    create_table :tasks do |t|
      change_column_null :tasks, :name, false
  end
end
