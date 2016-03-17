Rails.application.routes.draw do
  resources :apps, only: [:index, :show] do
    post :problem, on: :member
    post :solution, on: :member
  end
end
