class Users::RegistrationsController < Devise::RegistrationsController
  include RackSessionFix
  respond_to :json

  private

  def respond_with(resource, _opts = {})
    register_success(resource) && return if resource.persisted?

    register_failed(resource)
  end

  def register_success(resource)
    render json: resource
  end

  def register_failed(resource)
    render json: { errors: resource.errors }, status: :unauthorized
  end
end
