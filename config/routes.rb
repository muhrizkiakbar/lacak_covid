Rails.application.routes.draw do
  namespace :main do
    resources :personal_protective_equipments
  end
  namespace :main do
    resources :neighborhood_associations
  end
  namespace :main do
    resources :citizen_associations
  end
  namespace :main do
    resources :sub_districts
  end
  namespace :main do
    resources :districts
  end
  namespace :main do
    resources :cities
  end
  namespace :main do
    resources :provinces
  end
  namespace :main do
    resources :type_contacts
  end
  namespace :main do
    resources :transportations
  end
  namespace :main do
    resources :job_types
  end
  namespace :main do
    resources :tribes
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
