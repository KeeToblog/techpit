class User < ApplicationRecord

  has_many :lists, dependent: :destroy
  # has_manyは他のモデルとの間に「１対多」の繋がりがあることを示す。(「1」側にhas_manyを追加する。）
  # dependent: :destroyでオブジェクトが削除されるときに関連付けしたオブジェクトのdestroyメソッドが実行される。
  # この場合ユーザーを削除するとそれに紐づいたリストも削除される。
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :name, presence: true, length: { maximum: 20 }
end
