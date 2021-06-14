STATUS = YAML.load_file(Rails.root.join('config/locales/statuses.yml'))
class WashingsController < ActionController::API
  def index
    if washing_params[:customer_id].nil?
      washings = Washing.all
    else
      washings = Washing.where(customer_id: washing_params[:customer_id])
    end
    render json: { status: STATUS['success'], message: 'Loaded washer', data: washings }
  end

  def show
    washing = Washing.find(params[:id])
    render json: { status: STATUS['success'], message: 'Loaded washings', data: washing }
  end

  def create
    washing = Washing.new(washing_params)
    if washing.save
      render json: { status: STATUS['success'], message: 'The washings is created', data: washing }
    else
      render json: { status: STATUS['bad_request'], message: 'The washings is not created', data: washing.errors }
    end
  end

  def destroy
    washing = Washing.find_by_id(params[:id])
    if washing.nil?
      render json: { status: STATUS['not_found'], message: 'The washings is not found', data: washing.errors }
    else
      washing.destroy
      render json: { status: STATUS['success'], message: 'This washings is deleted', data: washing }
    end
  end



  private
  def washing_params
    params.permit(:id, :washer_id, :customer_id, :status, :remaining_time, :password)
  end

end
