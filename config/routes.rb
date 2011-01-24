Freshtracks::Application.routes.draw do
  resources :semesters
  resources :courses do
    collection do
     :auto_complete_for_searchkey
    end
  end

  resources :degree_requirements
  resources :wishlist_sections do
    collection do
      post :register_all
    end
  end

  match "sign_in", :to => "clearance#index"
  match "clearance/index"

  resources :registered_sections
  resources :sections
  match '/' => 'courses#index'
end
