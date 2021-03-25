STATUS = YAML.load_file(Rails.root.join('config/locales/statuses.yml'))
class CustomersController < ApplicationController
  def index
    customers = Customer.all
    render json: { status: STATUS['success'], message: 'Loaded customers', data: customers }
  end

  def show
    customer = Customer.find(params[:id])
    render json: { status: STATUS['success'], message: 'Loaded customer', data: customer }
  end

  def create
    customer = Customer.new(customer_params)
    if customer.save
      render json: { status: STATUS['success'], message: 'The customer is created', data: customer }
    else
      render json: { status: STATUS['bad_request'], message: 'The customer is not created', data: customer.errors }
    end
  end

  def destroy
    customer = Customer.find_by_id(params[:id])
    if customer.nil?
      render json: { status: STATUS['not_found'], message: 'The customer is not found', data: customer.errors }
    else
      customer.destroy
      render json: { status: STATUS['success'], message: 'This customer is deleted', data: customer }
    end
  end

  private
  def customer_params
    params.permit(:id, :name, :surname, :phonenumber)
  end

end