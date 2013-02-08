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
    @sbcons = Subcontractor.order(columns).paginate(page: params[:page]).per_page(30)
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

  def due_for_renewal
    @sbcons = Subcontractor.where("renewal_date <= ?", 1.month.from_now).page(params[:page]).per_page(10)
  end

  def scottish_subcons
    @sbcons = Subcontractor.where(scot: 'yes', approved_status: 'Approved').order(columns).page(params[:page])
  end

  def ne_eng
    @sbcons = Subcontractor.where(ne_eng: 'yes', approved_status: 'Approved').order(columns).page(params[:page])
  end

  def nw_eng
    @sbcons = Subcontractor.where(nw_eng: 'yes', approved_status: 'Approved').order(columns).page(params[:page])
  end

  def midlands
    @sbcons = Subcontractor.where(mid: 'yes', approved_status: 'Approved').order(columns).page(params[:page])
  end

  def se_eng
    @sbcons = Subcontractor.where(se_eng: 'yes', approved_status: 'Approved').order(columns).page(params[:page])
  end

  def sw_eng
    @sbcons = Subcontractor.where(sw_eng: 'yes', approved_status: 'Approved').order(columns).page(params[:page])
  end

  def london
    @sbcons = Subcontractor.where(ldn: 'yes', approved_status: 'Approved').order(columns).page(params[:page])
  end

  def wales
    @sbcons = Subcontractor.where(wales: 'yes', approved_status: 'Approved').order(columns).page(params[:page])
  end

  def all_approved
    @sbcons = Subcontractor.where(approved_status: 'Approved').order(columns).page(params[:page])
  end

  def labour
    @sbcons = Subcontractor.where(sbcon_type: 'Labour Only', approved_status: 'Approved').order(columns).page(params[:page])
  end

  def specialist
    @sbcons = Subcontractor.where(sbcon_type: 'Specialist', approved_status: 'Approved').order(columns).page(params[:page])
  end

  def both
    @sbcons = Subcontractor.where(sbcon_type: 'Both', approved_status: 'Approved').order(columns).page(params[:page])
  end

  private
  def columns
    order = sortable_column_order
  end
end
