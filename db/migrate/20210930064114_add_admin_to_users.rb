class AddAdminToUsers < ActiveRecord::Migration[6.1]
  def change
    #userテーブルにadmin(管理者)を追加しboolearnで真偽値を追加
    add_column :users, :admin, :boolean, default: false, null: false
  end
end
