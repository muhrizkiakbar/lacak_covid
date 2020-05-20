class AddIndexToUsernameObserver < ActiveRecord::Migration[5.2]
  def change
    # add_index :lampiran_eleven_username_observers, :username_telegram, index: {:name => "index_l_e_user_observer_on_username_tele"}
    # add_index :lampiran_eleven_username_observers, :last_activity_at, index: {:name => "index_l_e_user_observer_on_last_act"}
  end
end
