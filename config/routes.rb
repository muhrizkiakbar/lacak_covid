Rails.application.routes.draw do
  
  namespace :main do
    resources :provinces, except: :show do 
        resources :cities, except: :show do 
            resources :districts, except: :show do
                resources :sub_districts, except: :show do 
                  resources :citizen_associations, except: :show do
                    resources :neighborhood_associations, except: :show
                  end
                end
            end
        end
    end
    
    resources :type_contacts, :patients, :transportations, :job_types, :tribes, :marital_statuses, :personal_protective_equipments
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
