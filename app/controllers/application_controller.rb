class ApplicationController < ActionController::Base
  before_action :authenticate

  private
	def authenticate
		rodauth.require_authentication
	end
end
