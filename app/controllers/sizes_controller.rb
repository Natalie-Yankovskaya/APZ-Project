STATUS = YAML.load_file(Rails.root.join('config/locales/statuses.yml'))
class SizesController < ActionController::API
  def index
    sizes = Size.all
    render json: { status: STATUS['success'], message: 'Loaded size', data: sizes }
  end

  def show
    size = Size.find(params[:id])
    render json: { status: STATUS['success'], message: 'Loaded size', data: size }
  end

  def create
    size = Size.new(size_params)
    if size.save
      render json: { status: STATUS['success'], message: 'The size is created', data: size }
    else
      render json: { status: STATUS['bad_request'], message: 'The size is not created', data: size.errors }
    end
  end

  def destroy
    size = Size.find_by_id(params[:id])
    if size.nil?
      render json: { status: STATUS['not_found'], message: 'The size is not found', data: size.errors }
    else
      size.destroy
      render json: { status: STATUS['success'], message: 'This size is deleted', data: size }
    end
  end

  private
  def size_params
    params.permit(:id, :max_load, :price)
  end

end
