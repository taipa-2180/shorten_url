class ApplicationController < ActionController::API
  def host_name
    ENV["HOSTNAME"]
  end
end
