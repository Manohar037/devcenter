Rails.application.routes.draw do
  devise_for :authors
  get 'welcome/index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
resources:authors do
resources:articles
end
root 'welcome#index'
get 'search1', to: "authors#search1"
get 'search2', to: "articles#search2"
end
