# frozen_string_literal: true

Kaminari.configure do |config|
  config.default_per_page = 2
  # config.max_per_page = nil
  config.window = 4
  # config.outer_window = 0
  config.left = 1
  config.right = 3
  # config.page_method_name = :page
  # config.param_name = :page
  # config.max_pages = nil
  # config.params_on_first_page = false
end
