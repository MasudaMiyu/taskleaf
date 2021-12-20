class Task < ApplicationRecord
    
    before_validation :set_nameless_name

    #名前が存在するかしないかを検証する
    validates :name, presence: true
    #30文字以内かどうかを検証する
    validates :name, length: { maximum: 30 }
    
    #:以下をvalidate(クラスメソッド)に渡すことでTaskモデルにこのメソッドは検証のために利用するということを伝える
    validate :validate_name_not_including_comma
    
    #外部キーとしてuserを抱えていることを定義
    belongs_to :user
    #タスクの作成日時を降順にする
    scope :recent, -> { order(created_at: :desc)}


    #オブジェクトの外部から呼び出さないためprivateメソッドを使用する
    private
    
    def set_nameless_name
        self.name = '名前無し' if name.blank?
    end
    def validate_name_not_including_comma
    #errors.addでエラー内容を格納する
    #&.(ぼっち演算子)を入れることでnilでもエラーを吐かずnilのままif文を通過する
        errors.add(:name, 'にカンマを含めることはできません') if name&.include?(',')
    end
end
