# frozen_string_literal: true

class V1::PasswordResetsController < Clearance::BaseController
  skip_before_action :require_login
  skip_authorize_resource

  def create
    user = User.find_by(email: params[:email])
    if user
      token = Clearance::Token.new
      user.update(confirmation_token: token)
      # send email in real project to reset password
      #::ClearanceMailer.change_password(user).deliver
      # here sending confirmation token as response
      render json: {token: user.confirmation_token}
    else
      render json: {error: 'Email not found'}
    end
  end

  def update
    user = User.find_by(confirmation_token: params[:token])
    if user
      user.update(password: params[:password], confirmation_token: nil)
      render plain: "Password updated successfully", head: :ok
    else
      render json: { expired: true }
    end
  end
end
