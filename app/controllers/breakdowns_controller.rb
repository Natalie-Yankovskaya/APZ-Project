STATUS = YAML.load_file(Rails.root.join('config/locales/statuses.yml'))
class BreakdownsController < ActionController::API
  def index
    breakdown = Breakdown.all
    render json: { status: STATUS['success'], message: 'Loaded breakdown', data: breakdown }
  end

  def show
    breakdown = Breakdown.find(params[:id])
    render json: { status: STATUS['success'], message: 'Loaded breakdown', data: breakdown }
  end

  def create
    breakdown = Breakdown.new(breakdown_params)
    if breakdown.save
      render json: { status: STATUS['success'], message: 'The breakdown is created', data: breakdown }
    else
      render json: { status: STATUS['bad_request'], message: 'The breakdown is not created', data: breakdown.errors }
    end
  end

  def destroy
    breakdown = Breakdown.find_by_id(params[:id])
    if breakdown.nil?
      render json: { status: STATUS['not_found'], message: 'The breakdown is not found', data: breakdown.errors }
    else
      breakdown.destroy
      render json: { status: STATUS['success'], message: 'This breakdown is deleted', data: breakdown }
    end
  end

  private
  def breakdown_params
    params.permit(:id, :washer_id, :urgency, :taken, :status, :comment)
  end

end
