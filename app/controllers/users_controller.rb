require 'securerandom'

class UsersController < ApplicationController
  before_action :authenticate_user!, only: %i[update]

  before_action :set_user, only: %i[update]

  # POST /users
  def create
    @user = User.create!(user_params.merge({ registration_number: SecureRandom.hex(5) }))
    json_response(@user, :created)
  end

  # PATCH/PUT /users/1
  def update
    @user.update(user_params)
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_user
    @user = current_user || User.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def user_params
    params.require(:user).permit(:name, :cpf, :email, :password, :avatar, :course_id)
  end
end
