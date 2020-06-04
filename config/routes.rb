Rails.application.routes.draw do

  devise_for :users
  devise_scope :user do
    authenticated :user do
      root "users#show_profile"
    end

    unauthenticated do
      root to: "devise/sessions#new"
    end
    
  end

  namespace :l_six do
    resources :firsts do
      resources :seconds
      resources :thirds, except: [:index,:show] do
        resources :t_checkothers, except: [:index,:show]
      end
      resources :fourths do 
        resources :f_aboard_dests, except: [:index,:show]
        resources :f_out_town_dests, except: [:index,:show]
        resources :f_hospital_dests, except: [:index,:show]
        resources :f_animal_dests, except: [:index,:show]
        resources :f_pdp_dests, except: [:index,:show]
        resources :f_positive_dests, except: [:index,:show]
      end
      resources :fifths, except: [:index,:show]

    end
  end
  
  namespace :l_five do
    get "/report/daily" => "daily_report#index", as: "report_daily"
  end
  
  resources :users
  get "/user/show_profile" => "users#show_profile", as: "show_profile"
  get "/user/edit_profile" => "users#edit_profile", as: "edit_profile"
  patch "/user/edit_profile" => "users#update_profile", as: "update_profile"

  # resources :permissions
  resources :roles, except: [:show] do
    resources :role_permissions, only: [:index, :create]
  end

  namespace :telegram do
    resources :username_observers, except: [:show]
    resources :username_reporters, except: [:show]
    resources :message_report_reporters, only: [:index]
    resources :message_report_observers, only: [:index]
    resources :message_ili_reporters, only: [:index]
    resources :message_ili_observers, only: [:index]
    resources :message_closecont_reporters, only: [:index]
    resources :message_traveler_reporters, only: [:index]
    resources :message_closecont_observers, only: [:index]
    resources :message_traveler_observers, only: [:index]
    resources :message_checkin_reporters, only: [:index]

  end

  namespace :lampiran_eleven do
    resources :close_contact_informations do 
      resources :information_exposes, except: [:index,:show] do
        resources :close_contacts, except: [:index,:show]
        resources :close_contact_info_homes, except: [:index,:show]
      end
      resources :info_exposes_officers, except: [:index,:show] do 
        resources :contact_symptoms, except: [:index,:show]
        resources :respiratory_symptoms, except: [:index,:show]
        resources :other_symptoms, except: [:index,:show]
      end
      resources :comorbid_conditions, except: [:index,:show]
      resources :contact_statuses, except: [:index,:show]
      resources :specimen_contacts, except: [:index,:show]
    end
  end


  telegram_webhook Telegram::TelegramWebhooksController
  
  namespace :main do
    resources :provinces, except: [:show] do 
        resources :cities, except: [:show] do 
            resources :districts, except: [:show] do
                resources :sub_districts, except: [:show] do 
                  resources :citizen_associations, except: [:show] do
                    resources :neighborhood_associations, except: [:show]
                  end
                end
            end
        end
    end

    resources :dinkes_provinces, except: :show do
      resources :dinkes_regions, except: :show do
        resources :hospitals, except: :show 
        resources :public_health_centers, except: :show do
          resources :phc_of_sds, except: :show
        end
      end
    end

    get "/search_on_select2_cities/:province_id" => "cities#search_on_select2_cities", as: "search_on_select2_cities"
    get "/search_on_select2_districts/:city_id" => "districts#search_on_select2_districts", as: "search_on_select2_districts"
    get "/search_on_select2_sub_districts/:district_id" => "sub_districts#search_on_select2_sub_districts", as: "search_on_select2_sub_districts"
    get "/search_on_select2_citizen_associations/:sub_district_id" => "citizen_associations#search_on_select2_citizen_associations", as: "search_on_select2_citizen_associations"
    get "/search_on_select2_neighborhood_associations/:citizen_association_id" => "neighborhood_associations#search_on_select2_neighborhood_associations", as: "search_on_select2_neighborhood_associations"
    
    
    resources :job_positions,:set_locations,:type_contacts, :patients, :transportations, :job_types, :marital_statuses, :personal_protective_equipments, except: :show 
  end

  namespace :dashboard do
    get '/l_eleven' => 'l_eleven#index', :as => 'index_l_eleven' 

    get '/get_count_odp' => 'l_eleven#get_count_odp', :as => 'get_count_odp'
    get '/get_count_otg' => 'l_eleven#get_count_otg', :as => 'get_count_otg' 
    get '/get_count_pdp' => 'l_eleven#get_count_pdp', :as => 'get_count_pdp'
    get '/get_count_confirm' => 'l_eleven#get_count_confirm', :as => 'get_count_confirm'
    get '/get_count_done' => 'l_eleven#get_count_done', :as => 'get_count_done'
    get '/get_count_sick' => 'l_eleven#get_count_sick', :as => 'get_count_sick'
    get '/get_count_died' => 'l_eleven#get_count_died', :as => 'get_count_died'
    get '/get_count_covered' => 'l_eleven#get_count_covered', :as => 'get_count_covered'
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
