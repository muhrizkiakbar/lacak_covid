Rails.application.routes.draw do
  
  namespace :lampiran_eleven do
    resources :close_contact_informations do 
      resources :information_exposes do
        resources :close_contacts
        resources :close_contact_info_homes
      end
    end
  end

  resources :role_permissions
  resources :permissions
  resources :roles
  devise_for :users

  
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

    resources :dinkes_provinces, except: :show do
      resources :dinkes_regions, except: :show do
        resources :hospitals, except: :show 
      end
    end

    get "/search_on_select2_cities/:province_id" => "cities#search_on_select2_cities", as: "search_on_select2_cities"
    get "/search_on_select2_districts/:city_id" => "districts#search_on_select2_districts", as: "search_on_select2_districts"
    get "/search_on_select2_sub_districts/:district_id" => "sub_districts#search_on_select2_sub_districts", as: "search_on_select2_sub_districts"
    get "/search_on_select2_citizen_associations/:sub_district_id" => "citizen_associations#search_on_select2_citizen_associations", as: "search_on_select2_citizen_associations"
    get "/search_on_select2_neighborhood_associations/:citizen_association_id" => "neighborhood_associations#search_on_select2_neighborhood_associations", as: "search_on_select2_neighborhood_associations"
    
    
    resources :set_locations,:public_health_centers,:type_contacts, :patients, :transportations, :job_types, :tribes, :marital_statuses, :personal_protective_equipments, except: :show 
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
