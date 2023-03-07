Rails.application.routes.draw do
  devise_for :customer, controllers: {
    sessions: 'customer/sessions'
  }
  devise_for :owner,controllers: {
    sessions: 'owner/sessions'
  }

  resources :shops


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
