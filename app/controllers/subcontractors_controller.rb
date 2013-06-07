class SubcontractorsController < ApplicationController
  require 'pry'
  handles_sortable_columns do |conf|
    conf.sort_param = "s"
    conf.page_param = "p"
  end
  
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
    respond_to do |format|
      format.html
      format.json do
        render json: SubcontractorsDatatable.new(view_context, @subcontractors)
      end
    end
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

  def dashboard
    @sbcon_ins_prod = Subcontractor.where("exp_date_prod <= ?", 1.month.from_now).order(columns)
    @sbcon_ins_emp = Subcontractor.where("exp_date_emp <= ?", 1.month.from_now).order(columns)
    @sbcon_ins_pub = Subcontractor.where("exp_date_pub <= ?", 1.month.from_now).order(columns)
    @sbcon_ins_con = Subcontractor.where("exp_date_con_all <= ?", 1.month.from_now).order(columns)
  end

  def due_for_renewal
    @sbcons = Subcontractor.where("renewal_date <= ?", 1.month.from_now).page(params[:page]).per_page(10)
  end

  def scottish_subcons
    @sbcons = Subcontractor.where(scot: 'Yes', approved_status: 'Approved').order(columns).page(params[:page]).per_page(10)
  end

  def ne_eng
    @sbcons = Subcontractor.where(ne_eng: 'Yes', approved_status: 'Approved').order(columns).page(params[:page]).per_page(10)
  end

  def nw_eng
    @sbcons = Subcontractor.where(nw_eng: 'Yes', approved_status: 'Approved').order(columns).page(params[:page]).per_page(10)
  end

  def midlands
    @sbcons = Subcontractor.where(mid: 'Yes', approved_status: 'Approved').order(columns).page(params[:page]).per_page(10)
  end

  def se_eng
    @sbcons = Subcontractor.where(se_eng: 'Yes', approved_status: 'Approved').order(columns).page(params[:page]).per_page(10)
  end

  def sw_eng
    @sbcons = Subcontractor.where(sw_eng: 'Yes', approved_status: 'Approved').order(columns).page(params[:page])
  end

  def london
    @sbcons = Subcontractor.where(ldn: 'Yes', approved_status: 'Approved').order(columns).page(params[:page]).per_page(10)
  end

  def wales
    @sbcons = Subcontractor.where(wales: 'Yes', approved_status: 'Approved').order(columns).page(params[:page]).per_page(10)
  end

  def all_approved
    @sbcons = Subcontractor.where(approved_status: 'Approved').order(columns).page(params[:page]).per_page(10)
  end

  def labour
    @sbcons = Subcontractor.where(sbcon_type: 'Labour Only', approved_status: 'Approved').order(columns).page(params[:page]).per_page(10)
  end

  def specialist
    @sbcons = Subcontractor.where(sbcon_type: 'Specialist', approved_status: 'Approved').order(columns).page(params[:page]).per_page(10)
  end

  def both
    @sbcons = Subcontractor.where(sbcon_type: 'Both', approved_status: 'Approved').order(columns).page(params[:page]).per_page(10)
  end

  private
  def columns
    sortable_column_order do |column, direction|
      case column
      when "sbcon_name", "cscs_card", "op_avail", "ins_emp", "ins_prod", "ins_pub", "ins_con_all"
        "#{column} #{direction}"
      else
        "sbcon_name ASC"
      end
    end
  end
end
