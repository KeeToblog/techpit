class CardController < ApplicationController
  
  before_action :set_card, only: %i(show edit update destroy)

  def new
    @card = Card.new
    @list = List.find_by(id: params[:list_id])
  end
  # newはインスタンスを作成するためのメソッド。引数に何も入れてないので、空のインスタンスができる。（id, list_id, title, memo, created_at, updated_atがnilになる）
  #インスタンス変数@cardはビューでフォームを作成するとき（ビューへ渡すとき）に使う。

  def create
    @card = Card.new(card_params)
    if @card.save
      redirect_to :root
    else
      render action: :new
    end
  end
  # card_paramsメソッドを引数で呼び出す。
  # カードが作成されたらroot_pathにリダイレクトして指定ページ（top/index）に遷移させ、そうでない場合はカード作成画面（card/new）に遷移させる。

  def show
    # @card = Card.find_by(id: params[:id])
  end
  # URIを確認すれば何を引数で呼び出せばいいかわかる。

  def edit
    # @card = Card.find_by(id: params[:id])
    @lists = List.where(user: current_user)
  end
  # Listモデルからuser_idがcurrent_user.idと一致するレコードの情報を取得する、というコード

  def update
    # @card = Card.find_by(id: params[:id])
    if @card.update_attributes(card_params)
      redirect_to :root
    else
      render action: :edit
    end
  end
  # update_attributesメソッドは属性のハッシュを受け取り、成功時には更新と保存を続けて同時に行う。
  # 更新が成功したらroot_pathにリダイレクトしてトップページ（top/index）に遷移させ、そうでない場合はカード編集ページ（card/edit）に線させる。

  def destroy
    # @card = Card.find_by(id: params[:id])
    @card.destroy
    redirect_to :root
  end

  private
    def card_params
      params.require(:card).permit(:title, :memo, :list_id)
    end
    # paramsとは送られてきたリクエスト情報をひとまとめにしたもの。
    # requireで受け取る値のキーを設定。
    # permitで変更を加えられるキーを指定。

    def set_card
      @card = Card.find_by(id: params[:id])
    end
end
