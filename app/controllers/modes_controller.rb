STATUS = YAML.load_file(Rails.root.join('config/locales/statuses.yml'))
class ModesController < ActionController::API
  def index

      modes = Mode.all
      render json: { status: STATUS['success'], message: 'Loaded modes', data: modes }
      
    end
    
  end

  def show
    mode = Mode.find(params[:id])
    render json: { status: STATUS['success'], message: 'Loaded mode', data: mode }
  end

  def create
    mode = Mode.new(mode_params)
    if mode.save
      render json: { status: STATUS['success'], message: 'The mode is created', data: mode }
    else
      render json: { status: STATUS['bad_request'], message: 'The mode is not created', data: mode.errors }
    end
  end

  def destroy
    mode = Mode.find_by_id(params[:id])
    if mode.nil?
      render json: { status: STATUS['not_found'], message: 'The mode is not found', data: mode.errors }
    else
      mode.destroy
      render json: { status: STATUS['success'], message: 'This mode is deleted', data: mode }
    end
  end

  private
  def mode_params
    params.permit(:id, :name, :minutes, :price)
  end

end
