class ApplicationController < ActionController::Base
  before_action :authenticate

  private

  def authenticate
    authenticate_or_request_with_http_basic do |username, password|
      username == 'skyjam' && password == ENV['SKYJAM_PASSWORD'] ||
      username == 'ales' && password == ENV['ALES_PASSWORD'] ||
      username == 'markus' && password == ENV['MARKUS_PASSWORD'] ||
      username == 'delf' && password == ENV['DELF_PASSWORD'] ||
      username == 'rgsoc' && password == ENV['RGSOC_PASSWORD']
    end
  end
end
