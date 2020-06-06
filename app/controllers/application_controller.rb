class ApplicationController < ActionController::API
  include Clearance::Controller

  def form_authenticity_token; end
  rescue_from CanCan::AccessDenied do |exception|
    msg = { errors: { status: "401", title: "Unauthorized", message: exception.message } }.to_json
    render json: msg, status: 401
  end
end
