Rails.application.routes.draw do
  resources :apps, only: [:index, :show] do
  end
end
