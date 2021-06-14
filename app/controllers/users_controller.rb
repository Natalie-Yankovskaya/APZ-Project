STATUS = YAML.load_file(Rails.root.join('config/locales/statuses.yml'))
class UsersController < ApplicationController

  def create
    user = User.new(user_params)
    if user.save
      render json: { status: STATUS['success'], message: 'The user is created', data: user }
    else
      render json: { status: STATUS['bad_request'], message: 'The user is not created', data: user.errors }
    end
  end
  




  private
  def user_params
    params.permit(:id, :name, :email, :role, :password)
  end

end
