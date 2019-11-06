Rails.application.routes.draw do

  devise_for :users 
  # Devise（サインアップ・サインイン機能）のルーティングは全てusersに集約されている
  #get "/" => "top#index"
  root 'top#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get 'list/new'
  post 'list/create'

  #resources :list, only: %i(new create)
  # 上記のresourcesメソッドで同じlistルーティングができるらしいができず。頓挫。

  #get "list/:id/edit" => "list#edit"
  #patch "list/:id" => "list#update"
  resources :list, only: %i(edit update destroy) do
    resources :card, exept: %i(index)
    # 今回はindexアクション以外を使うので、resources :card, only: %i(new create show edit update destroy)の代わりに上記のコマンドが使える。
  end
  # ルーティングを入れ子（ネスト）にすることで親子関係をルーティングで表すことができる。カードはリストの「子」になってる。
end
