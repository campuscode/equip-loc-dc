class EquipmentController < ApplicationController

  def new
    @equipment = Equipment.new
    @categories = Category.all
  end

  def create
    @equipment = Equipment.new(equipment_params)
    if @equipment.save
      redirect_to @equipment
    else
      flash[:notice] = 'Não foi possível cadastrar o equipamento'
      @categories = Category.all
      render :new
    end
  end

  def show
    @equipment = Equipment.find(params[:id])
  end

  private

  def equipment_params
    params.require(:equipment).permit(:serial_number, :replacement_value, :name,
                                      :description, :acquisition_date, :usage_limit,
                                      :image, :category_id, :manufacturer, :supplier)
  end


end
