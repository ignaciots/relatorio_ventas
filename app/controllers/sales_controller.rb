class SalesController < ApplicationController
  before_filter :authenticate_user!
  load_and_authorize_resource
  # before_action :set_sale, only: [:show, :edit, :update, :destroy]

  def index
    set_sales_list
  end

  def show
    if !current_user.administrador?
      if Sale.find_by(id: params[:id]).user.id != current_user.id
        raise CanCan::AccessDenied.new
      end
    end
  end

  def new
    #@sale = current_user.sales.new
    @sale = Sale.new
  end

  def edit
  end

  def create
    @sale = current_user.store.sales.new sale_params
    @sale.user_id = current_user.id

    respond_to do |format|
      if @sale.save
        format.html { redirect_to @sale, notice: 'La venta fue creada.' }
        format.json { render :show, status: :created, location: @sale }
      else
        format.html { render :new }
        format.json { render json: @sale.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @sale.update(sale_params)
        format.html { redirect_to @sale, notice: 'La venta fue actualizada exitosamente.' }
        format.json { render :show, status: :ok, location: @sale }
      else
        format.html { render :edit }
        format.json { render json: @sale.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @sale.destroy
    respond_to do |format|
      format.html { redirect_to sales_url, notice: 'La venta fue eliminada exitosamente.' }
      format.json { head :no_content }
    end
  end

  private
    def set_sales_list
      if current_user.administrador?
        @sales = Sale.all
      elsif current_user.supervisor?
        current_user.stores.each do |store|
          @sales = store.sales
        end
      elsif current_user.vendedor?
        @sales = current_user.sales
      else
        raise CanCan::AccessDenied.new
      end
    end

    def sale_params
      params.require(:sale).permit(:sales_date, :number_of_bills, :bill_sale_amount, :number_of_invoices, :invoice_sale_amount)
    end
end
