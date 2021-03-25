STATUS = YAML.load_file(Rails.root.join('config/locales/statuses.yml'))
class ServicesController < ApplicationController
  def index
    services = Service.all
    render json: { status: STATUS['success'], message: 'Loaded services', data: services }
  end

  def show
    service = Service.find(params[:id])
    render json: { status: STATUS['success'], message: 'Loaded service', data: service }
  end

  def create
    service = Service.new(service_params)
    if service.save
      render json: { status: STATUS['success'], message: 'The service is created', data: service }
    else
      render json: { status: STATUS['bad_request'], message: 'The service is not created', data: service.errors }
    end
  end

  def destroy
    service = Service.find_by_id(params[:id])
    if service.nil?
      render json: { status: STATUS['not_found'], message: 'The service is not found', data: service.errors }
    else
      service.destroy
      render json: { status: STATUS['success'], message: 'This service is deleted', data: service }
    end
  end

  private
  def service_params
    params.permit(:id, :washing_id, :mode_id, :washing_powder)
  end

end