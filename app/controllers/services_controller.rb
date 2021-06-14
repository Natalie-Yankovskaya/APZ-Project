STATUS = YAML.load_file(Rails.root.join('config/locales/statuses.yml'))
class ServicesController < ApplicationController
  def index
    services = Service.all
    render json: { status: STATUS['success'], message: "Loaded services", data: services }
    
  end

  def show

    pattern = /^Bearer /
    header  = request.headers['Authorization']
    header.gsub(pattern, '') if header && header.match(pattern)
    if header.nil?
      render json: { status: STATUS['bad_request'], message: 'Authorization failed'}
    else

    service = Service.find(params[:id])

    conditioner = service['conditioner']
    washing_powder = service['washing_powder']

    conditioner_price = 0
    powder_price = 0

    if conditioner == true && washing_powder == true
      conditioner_price = 5
      powder_price = 5
    elsif conditioner == true
      conditioner_price = 5
    else
      powder_price = 5
    end

    mode = Mode.find_by(id: service['mode_id'])
    mode_price = mode['price']

    washing = Washing.find_by(id: service['washing_id'])
    washer = Washer.find_by(id: washing['washer_id'])
    size = Size.find_by(id: washer['size_id'])
    size_price = size['price']

    total = conditioner_price + powder_price + mode_price + size_price

    render json:
    {
      status: STATUS['success'],
      message: "Loaded service:  Price for washing powder: #{powder_price},  Price for conditioner: #{conditioner_price},   Price for size: #{size_price},  Price for mode: #{mode_price},  Total: #{total}  ",
      data: service
    }
  end

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
    params.permit(:id, :washing_id, :mode_id, :washing_powder, :conditioner)
  end

end