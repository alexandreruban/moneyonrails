class ApplicationController < ActionController::Base
  include Pagy::Backend
  include Authentication

  allow_browser versions: :modern
end
