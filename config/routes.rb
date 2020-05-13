Rails.application.routes.draw do
  
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
    
    resources :type_contacts, :patients, :transportations, :job_types, :tribes, :marital_statuses, :personal_protective_equipments
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
