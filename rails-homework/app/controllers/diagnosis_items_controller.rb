class DiagnosisItemsController < ApplicationController
  def index
    @diagnosis_items = DiagnosisItem.all
  end

  def show
    @diagnosis_item = DiagnosisItem.find(params[:id])
  end

  def new
    @diagnosis_item = DiagnosisItem.new
  end

  def create
    @diagnosis_item = DiagnosisItem.new(diagnosis_item_params)
    if @diagnosis_item.save
      redirect_to @diagnosis_item
    else
      render :new
    end
  end

  def edit
    @diagnosis_item = DiagnosisItem.find(params[:id])
  end

  def update
    @diagnosis_item = DiagnosisItem.find(params[:id])
    if @diagnosis_item.update(diagnosis_item_params)
      redirect_to @diagnosis_item
    else
      render :edit
    end
  end

  def destroy
    @diagnosis_item = DiagnosisItem.find(params[:id])
    @diagnosis_item.destroy
    redirect_to "/diagnosis_items"
  end

  private

  def diagnosis_item_params
    params.require(:diagnosis_item).permit(:content, :patient_id, :physician_id)
  end
end
