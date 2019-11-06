class ListController < ApplicationController

  before_action :set_list, only: %i(edit update destroy)
  # edit,update,destroyアクションの前にset_listメソッドに飛ばす。

  def new
    @list = List.new
  end
  # newはインスタンスを作成するメソッド。@listはビューでフォームを作成するときに使うインスタンス変数。

  def create
    @list = List.new(list_params)
    if @list.save
      redirect_to :root
    else
      render action: :new
    end
    # list_paramsメソッドを引数で呼び出す。
    # リストが作成されたらroot_pathにリダイレクトして指定ページ（top/index）に遷移させ、そうでない場合はリスト作成画面に遷移させる。
  end

  def edit
    #@list = List.find_by(id: params[:id])
    #set_listで定義しているので不要。
  end
  
  # find_byメソッドは与えられた条件にマッチするレコードのうち最初のレコードだけを返します。
  # インスタンス変数を使うことで、コントローラーからビューへ変数を渡すことができる。

  def update
    # @list = List.find_by(id: params[:id]) set_listで定義しているので不要。
    if @list.update_attributes(list_params)
      redirect_to :root
    else
      render action: :edit
    end
  end
  # update_attributesメソッドは属性のハッシュを受け取り、成功時には更新と保存を続けて同時に行う。
  # 更新が成功したらroot_pathにリダイレクトしてトップページ（top/index）に遷移させ、そうでない場合はリスト編集ページ（list/edit）に線させる。

  def destroy
    @list.destroy
    redirect_to :root
  end
  # @list.destroyで指定のリストを削除できる。destroyはデータベースから削除するメソッド。

  private
    def list_params
      params.require(:list).permit(:title).merge(user: current_user)
    end
    # paramsとは送られてきたリクエスト情報をひとまとめにしたもの。
    # requireで受け取る値のキーを設定。
    # permitで変更を加えられるキーを指定。
    # mergeメソッドは２つのハッシュを統合するメソッド。（今回は誰がリストを作成したかがという情報が必要なのでuserと統合させる）

    def set_list
      @list = List.find_by(id: params[:id])
    end
end
