# frozen_string_literal: true

class V1::SessionsController < Clearance::SessionsController
  skip_before_action :require_login
  # POST /sign_in
  def create
    @user = authenticate(params)
    sign_in(@user) do |status|
      if status.success?
        render json: UserSerializer.new(@user), status: :ok
      else
        render json: { message: status.failure_message }, status: :unauthorized
      end
    end
  end

end
