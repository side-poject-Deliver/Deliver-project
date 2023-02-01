Rails.application.routes.draw do
  resource :owner do
    resources :shops do
      resources :products
      resources :orders, only: [:index, :show]
    end
  end

  resource :customer do
    resources :orders , except: [:destroy] 
    resources :shops , only: [:index] do
      resources :products
    end
  end

  resource :courier do
    resources :orders , only: [:index, :show]
  end


  resources :products
end
