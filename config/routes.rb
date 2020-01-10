Rails.application.routes.draw do
  get 'home/index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # ログイン画面をtopページに設定
  devise_scope :user do
    root :to => "devise/sessions#new"
  end

  # devise_for :users, controllers: {
  #     sessions: 'users/sessions'
  # }



  # エラー処理用
  get '*anything' => 'errors#routing_error'
end
