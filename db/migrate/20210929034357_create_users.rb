class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :name, null: false
      t.string :email, null: false
      t.string :password_digest, null: false
      
      #書き込み・修正した際タイムスタンプを保存しておく為のカラムを作成
      t.timestamps
      
      #t.index emailをアルファベット順に並べ替える
      #unique: true 重複を防ぐ
      t.index :email, unique: true
    end
  end
end
