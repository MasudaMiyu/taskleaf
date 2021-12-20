class AddUserIdTasks < ActiveRecord::Migration[6.1]
  def up
    #SQLによって今まで作られたタスクが全て削除される
    execute 'DELETE FROM tasks;'
    add_reference :tasks, :user, null: false, index: true
  end

  def down
    remove_reference :tasks, :user, index: true
  end
end

