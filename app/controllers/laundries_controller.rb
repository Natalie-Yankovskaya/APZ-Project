STATUS = YAML.load_file(Rails.root.join('config/locales/statuses.yml'))
class LaundriesController < ActionController::API
  def index
    
    laundries = Laundry.all
    render json: { status: STATUS['success'], message: 'Loaded laundries', data: laundries }
    
  end

  def show
    laundry = Laundry.find(params[:id])
    render json: { status: STATUS['success'], message: 'Loaded laundry', data: laundry }
  end

  def create
    laundry = Laundry.new(laundry_params)
    if laundry.save
      render json: { status: STATUS['success'], message: 'The laundry is created', data: laundry }
    else
      render json: { status: STATUS['bad_request'], message: 'The laundry is not created', data: laundry.errors }
    end
  end

  def destroy
    laundry = Laundry.find_by_id(params[:id])
    if laundry.nil?
      render json: { status: STATUS['not_found'], message: 'The laundry is not found', data: laundry.errors }
    else
      laundry.destroy
      render json: { status: STATUS['success'], message: 'This laundry is deleted', data: laundry }
    end
  end

  private
  def laundry_params
    params.permit(:id, :name, :address, :city)
  end

end
