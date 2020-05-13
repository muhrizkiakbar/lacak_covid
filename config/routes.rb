Rails.application.routes.draw do

  
  namespace :main do
    resources :personal_protective_equipments
  end
  
  namespace :main do
    resources :provinces do 
        resources :cities do 
            resources :districts do
                resources :sub_districts do 
                  resources :citizen_associations do
                    resources :neighborhood_associations
                  end
                end
            end
        end
    end
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
