class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception

    rescue_from ActionController::InvalidAuthenticityToken do |exception|
        sign_out_user # Example method that will destroy the user cookies
      end
end
