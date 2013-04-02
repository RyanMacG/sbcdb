class SubcontractorsController < ApplicationController
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
    @sbcons = Subcontractor.order(columns).paginate(page: params[:page]).per_page(10)
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
    @sbcons = Subcontractor.where(scot: 'yes', approved_status: 'Approved').order(columns).page(params[:page]).per_page(10)
  end

  def ne_eng
    @sbcons = Subcontractor.where(ne_eng: 'yes', approved_status: 'Approved').order(columns).page(params[:page]).per_page(10)
  end

  def nw_eng
    @sbcons = Subcontractor.where(nw_eng: 'yes', approved_status: 'Approved').order(columns).page(params[:page]).per_page(10)
  end

  def midlands
    @sbcons = Subcontractor.where(mid: 'yes', approved_status: 'Approved').order(columns).page(params[:page]).per_page(10)
  end

  def se_eng
    @sbcons = Subcontractor.where(se_eng: 'yes', approved_status: 'Approved').order(columns).page(params[:page]).per_page(10)
  end

  def sw_eng
    @sbcons = Subcontractor.where(sw_eng: 'yes', approved_status: 'Approved').order(columns).page(params[:page])
  end

  def london
    @sbcons = Subcontractor.where(ldn: 'yes', approved_status: 'Approved').order(columns).page(params[:page]).per_page(10)
  end

  def wales
    @sbcons = Subcontractor.where(wales: 'yes', approved_status: 'Approved').order(columns).page(params[:page]).per_page(10)
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
      when "con_tel_num", "cscs_card", "op_avail", "ins_emp", "ins_prod", "ins_pub", "ins_con_all"
        "#{column} #{direction}"
      else
        "sbcon_name ASC"
      end
    end
  end
end
