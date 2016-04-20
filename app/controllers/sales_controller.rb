class SalesController < ApplicationController
  before_filter :authenticate_user!
  load_and_authorize_resource
  # before_action :set_sale, only: [:show, :edit, :update, :destroy]

  def index
    set_sale_listing
  end

  def show
    if Role.find_by(name: "admin").id != current_user.role_id
      if Sale.find_by(id: params[:id]).user.id != current_user.id
        raise CanCan::AccessDenied.new
      end
    end
  end

  def new
    @sale = current_user.sales.new
  end

  def edit
  end

  def create
    @sale = Sale.new(sale_params)
    @sale.user_id = current_user.id
    @sale.store_id = current_user.store.id

    respond_to do |format|
      if @sale.save
        format.html { redirect_to @sale, notice: 'Sale was successfully created.' }
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
        format.html { redirect_to @sale, notice: 'Sale was successfully updated.' }
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
      format.html { redirect_to sales_url, notice: 'Sale was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_sale_listing
      if Role.find_by(name: "admin").id == current_user.role_id
        @sales = Sale.all
      elsif Store.exists?(id: current_user.store_id)
        @sales = current_user.store.sales
      else
        raise CanCan::AccessDenied.new
      end
    end


    def sale_params
      params.require(:sale).permit(:sales_date, :number_of_bills, :bill_sale_amount, :number_of_invoices, :invoice_sale_amount, :store_id, :user_id)
    end
end
