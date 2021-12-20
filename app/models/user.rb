class User < ApplicationRecord
    #passwordとpassword_confirmationを使えるようにする
    has_secure_password
    #空データを保存できないようにする
    validates :name, presence: true
    #データが重複しないようにする
    validates :email, presence: true, uniqueness: true
    #外部キーが複数個あることを定義(tasks)
    has_many :tasks
end
