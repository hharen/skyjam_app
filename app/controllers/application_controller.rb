class ApplicationController < ActionController::Base
  before_action :authenticate

  private

  def authenticate
    authenticate_or_request_with_http_basic do |username, password|
      username == 'skyjam' && password == ENV['SKYJAM_PASSWORD'] ||
      username == 'ales' && password == ENV['ALES_PASSWORD'] ||
      username == 'markus' && password == ENV['MARKUS_PASSWORD']
    end
  end
end
