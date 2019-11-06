class Card < ApplicationRecord

  belongs_to :list
  # 「１対多」の「多」側ではbelongs_toをつける。

  validates :title, length: { in: 1..255 }
  # タイトルの文字数が１文字以上255文字以下

  validates :memo, length: { maximum: 1000}
  # memoカラムの最大文字数が1000文字以下

end
