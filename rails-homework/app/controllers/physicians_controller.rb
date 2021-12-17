class PhysiciansController < ApplicationController
  def index
    @physicians = Physician.all
  end

  def show
    @physician = Physician.find(params[:id])
  end
end
