class PropertiesController < ApplicationController
  before_filter :authenticate_user!
  load_and_authorize_resource
  # before_action :set_property, only: [:show, :edit, :update, :destroy]

  def index
    set_properties_list
  end

  def show
  end

  def new
    # @property = Property.new
  end

  def edit
  end

  def create
    # @property = Property.new(property_params)

    respond_to do |format|
      if @property.save
        format.html { redirect_to @property, notice: 'Property was successfully created.' }
        format.json { render :show, status: :created, location: @property }
      else
        format.html { render :new }
        format.json { render json: @property.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @property.update(property_params)
        format.html { redirect_to @property, notice: 'Property was successfully updated.' }
        format.json { render :show, status: :ok, location: @property }
      else
        format.html { render :edit }
        format.json { render json: @property.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @property.destroy
    respond_to do |format|
      format.html { redirect_to properties_url, notice: 'Property was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_properties_list
      if current_user.administrador?
        @properties = Property.all
      else
        @properties = []
        current_user.stores.each do |store|
          @properties << Property.find_by(id: store.property_id)
        end
      end
    end
    # def set_property
    #   @property = Property.find(params[:id])
    # end

    def property_params
      params.require(:property).permit(:name, :address)
    end
end
