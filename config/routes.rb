Rails.application.routes.draw do


  namespace :telegram do
    resources :message_closecont_observers
  end
  namespace :telegram do
    resources :message_traveler_observers
  end
  namespace :telegram do
    resources :message_closecont_reporters
  end
  namespace :telegram do
    resources :message_traveler_reporters
  end
  namespace :telegram do
    resources :message_checkin_reporters
  end
  devise_for :users
  resources :users
  get "/user/show_profile" => "users#show_profile", as: "show_profile"
  get "/user/edit_profile" => "users#edit_profile", as: "edit_profile"
  patch "/user/edit_profile" => "users#show_profile", as: "update_profile"

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
      resources :information_exposes, except: [:index] do
        resources :close_contacts, except: [:index]
        resources :close_contact_info_homes, except: [:index]
      end
      resources :info_exposes_officers, except: [:index] do 
        resources :contact_symptoms, except: [:index]
        resources :respiratory_symptoms, except: [:index]
        resources :other_symptoms, except: [:index]
      end
      resources :comorbid_conditions, except: [:index]
      resources :contact_statuses, except: [:index]
      resources :specimen_contacts, except: [:index]
    end
  end


  telegram_webhook Telegram::TelegramWebhooksController
  
  namespace :main do
    resources :provinces, except: [:show, :edit] do 
        resources :cities, except: [:show, :edit] do 
            resources :districts, except: [:show, :edit] do
                resources :sub_districts, except: [:show, :edit] do 
                  resources :citizen_associations, except: [:show, :edit] do
                    resources :neighborhood_associations, except: [:show, :edit]
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
