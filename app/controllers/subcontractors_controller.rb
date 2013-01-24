class SubcontractorsController < ApplicationController
  handles_sortable_columns
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

  def index
    order = sortable_column_order
    @sbcons = Subcontractor.order(order).paginate(page: params[:page]).per_page(30)
  end
end
