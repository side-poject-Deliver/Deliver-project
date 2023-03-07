Rails.application.routes.draw do
  resources :shops do
    resources :products
  end

  resource :owner do
    resources :shops do
      resource :product
      resources :orders, only: [:index, :show]
    end
  end

  resource :customer do
    resources :orders , except: [:destroy] 
    resources :shops , only: [:index] do
      resource :product
    end
  end

  resource :courier do
    resources :orders , only: [:index, :show]
  end
end
