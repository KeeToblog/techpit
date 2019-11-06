class TopController < ApplicationController

  def index
    @lists = List.where(user: current_user).order("created_at ASC")
    # List.where(user: current_user)と書くことで、user_idが現在ログインしているユーザー(current_user)のレコードを取得する。
    # .order("created_at ASC")は作成した日付を昇順に並べる。
  end
  
end
