class SuppliersController < ApplicationController
  before_action :set_supplier, only: %i[show edit update destroy]

  def index
    @suppliers = Supplier.all
  end

  def new
    @supplier = Supplier.new
  end

  def create
    @supplier = Supplier.new(list_params)
    if @supplier.save
      redirect_to suppliers_path
    else
      flash.now[:alert] = 'Invalid input value !!!'
      render :new
    end
  end

  def edit
    redirect_to suppliers_path if @supplier.nil?
  end

  def update
    @supplier = Supplier.find_by(id: params[:id])
    if @supplier.update(list_params)
      redirect_to suppliers_path
    else
      flash.now[:alert] = 'Invalid input value !!!'
      render :edit
    end
  end

  def show; end

  def destroy
    @supplier&.destroy
    redirect_to suppliers_path
  end

  private

  def set_supplier
    @supplier = Supplier.find_by(id: params[:id])
  end

  def list_params
    params.require(:supplier).permit(:name)
  end
end
