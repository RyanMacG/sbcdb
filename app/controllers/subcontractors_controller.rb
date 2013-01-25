class SubcontractorsController < ApplicationController
  handles_sortable_columns
  def new
    @subcontractor = Subcontractor.new
  end

  def create
    @subcontractor = Subcontractor.new(params[:subcontractor])
    if @subcontractor.save
      flash[:success] = "Subcontractor Added to Database"
      redirect_to @subcontractor
    else
      render 'new'
    end
  end

  def show
    @sbcon = Subcontractor.find(params[:id])
  end

  def index
    # order = sortable_column_order do |column, direction|
    # case column
    #   when "approved_status"
    #     "#{column} #{direction}"
    #   when "created_at", "updated_at"
    #     "#{column} #{direction}, approved_status ASC"
    #   else
    #     "approved_status, sbcon_name ASC"
    #   end
    # end
    order = sortable_column_order
    @sbcons = Subcontractor.order(order).paginate(page: params[:page]).per_page(30)
  end

  def edit
    @subcontractor = Subcontractor.find(params[:id])
  end

  def update
    @subcontractor = Subcontractor.find(params[:id])
    if @subcontractor.update_attributes(params[:subcontractor])
      flash[:success] = "Subcontractor Updated"
      redirect_to @subcontractor
    else
      render 'edit'
    end
  end
end
