STATUS = YAML.load_file(Rails.root.join('config/locales/statuses.yml'))
class WashersController < ActionController::API
  def index
    washers = Washer.all
    render json: { status: STATUS['success'], message: 'Loaded washer', data: washers }
  end

  def show
    washer = Washer.find(params[:id])
    render json: { status: STATUS['success'], message: 'Loaded washer', data: washer }
  end

  def create
    washer = Washer.new(washer_params)
    if washer.save
      render json: { status: STATUS['success'], message: 'The washer is created', data: washer }
    else
      render json: { status: STATUS['bad_request'], message: 'The washer is not created', data: washer.errors }
    end
  end

  def destroy
    washer = Washer.find_by_id(params[:id])
    if washer.nil?
      render json: { status: STATUS['not_found'], message: 'The washer is not found', data: washer.errors }
    else
      washer.destroy
      render json: { status: STATUS['success'], message: 'This washer is deleted', data: washer }
    end
  end

  private
  def washer_params
    params.permit(:id, :laundry_id, :serial_number, :firm, :model, :status, :number_of_programs, :size_id)
  end

end
