class SubcontractorsController < ApplicationController
  def new
    @subcontractor = Subcontractor.new
  end

  def create
    @subcontractor = Subcontractor.new(params[:subcontractor])
    if @subcontractor.save
      redirect_to @subcontractor
    else
      render 'new'
    end
  end

  def show
    @sbcon = Subcontractor.find(params[:id])
  end
end
