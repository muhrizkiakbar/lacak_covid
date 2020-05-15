Rails.application.routes.draw do


  devise_for :users
  resources :users
  # resources :permissions
  resources :roles do
    resources :role_permissions
  end

  namespace :telegram do
    resources :username_observers
    resources :username_reporters
    resources :message_report_reporters, only: [:index]
    resources :message_report_observers, only: [:index]
    resources :message_ili_reporters, only: [:index]
    resources :message_ili_observers, only: [:index]
  end

  namespace :lampiran_eleven do
    resources :close_contact_informations do 
      resources :information_exposes do
        resources :close_contacts
        resources :close_contact_info_homes
      end
      resources :info_exposes_officers do 
        resources :contact_symptoms
        resources :respiratory_symptoms
        resources :other_symptoms
      end
      resources :comorbid_conditions
      resources :contact_statuses
      resources :specimen_contacts
    end
  end


  telegram_webhook Telegram::TelegramWebhooksController
  
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
        resources :public_health_centers, except: :show
      end
    end

    get "/search_on_select2_cities/:province_id" => "cities#search_on_select2_cities", as: "search_on_select2_cities"
    get "/search_on_select2_districts/:city_id" => "districts#search_on_select2_districts", as: "search_on_select2_districts"
    get "/search_on_select2_sub_districts/:district_id" => "sub_districts#search_on_select2_sub_districts", as: "search_on_select2_sub_districts"
    get "/search_on_select2_citizen_associations/:sub_district_id" => "citizen_associations#search_on_select2_citizen_associations", as: "search_on_select2_citizen_associations"
    get "/search_on_select2_neighborhood_associations/:citizen_association_id" => "neighborhood_associations#search_on_select2_neighborhood_associations", as: "search_on_select2_neighborhood_associations"
    
    
    resources :job_positions,:set_locations,:type_contacts, :patients, :transportations, :job_types, :tribes, :marital_statuses, :personal_protective_equipments, except: :show 
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
