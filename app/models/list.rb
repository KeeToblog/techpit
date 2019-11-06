class List < ApplicationRecord
  
  belongs_to :user
  # 「１対多」の「多」側ではbelongs_toをつける。

  has_many :cards, dependent: :destroy
  # has_manyは他のモデルとの間に「１対多」の繋がりがあることを示す。(「1」側にhas_manyを追加する。）
  # dependent: :destroyでオブジェクトが削除されるときに関連付けしたオブジェクトのdestroyメソッドが実行される。
  # この場合リストを削除するとそれに紐づいたカードも削除される。

  validates :title, length: { in: 1..255 }
  # データベースに保存される前に検証する仕組みがバリデーション。
  # 今回はリストのタイトルが1文字以上255文字以下でないと弾かれるようになってる。
end
