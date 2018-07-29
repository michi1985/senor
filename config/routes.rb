Senor::Application.routes.draw do

  get "dashbords/home"
  devise_for :users, :controllers => {
    omniauth_callbacks: "users/omniauth_callbacks",
    registrations: "registrations"
  }

  resources :users, only: [:index, :destroy]
  # Customer->Store->Ticketで３段階にネスト
  resources :customers do
    resources :stores do
      resources :tickets#, only: [:index]
    end
  end
  resources :stores, only: [:index]
  resources :tickets, only: [:index]

# ログイン画面をホームにする
  devise_scope :user do
    root :to => "devise/sessions#new"
  end
end
