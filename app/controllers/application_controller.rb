class ApplicationController < ActionController::Base
  # CSRFを無効
  protect_from_forgery with: :null_session
end
