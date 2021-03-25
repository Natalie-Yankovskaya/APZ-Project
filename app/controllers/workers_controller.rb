STATUS = YAML.load_file(Rails.root.join('config/locales/statuses.yml'))
class WorkersController < ActionController::API
  def index
    workers = Worker.all
    render json: { status: STATUS['success'], message: 'Loaded worker', data: workers }
  end

  def show
    worker = Worker.find(params[:id])
    render json: { status: STATUS['success'], message: 'Loaded worker', data: worker }
  end

  def create
    worker = Worker.new(worker_params)
    if worker.save
      render json: { status: STATUS['success'], message: 'The worker is created', data: worker }
    else
      render json: { status: STATUS['bad_request'], message: 'The worker is not created', data: worker.errors }
    end
  end

  def destroy
    worker = Worker.find_by_id(params[:id])
    if worker.nil?
      render json: { status: STATUS['not_found'], message: 'The worker is not found', data: worker.errors }
    else
      worker.destroy
      render json: { status: STATUS['success'], message: 'This worker is deleted', data: worker }
    end
  end

  private
  def worker_params
    params.permit(:id, :laundry_id, :name, :surname, :phonenumber)
  end

end
