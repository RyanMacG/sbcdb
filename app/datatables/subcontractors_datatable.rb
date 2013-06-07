class SubcontractorsDatatable
  delegate :params, :h, :link_to, to: :@view

  def initialize(view, subcontractors)
    @view = view
  end

  def as_json(option = {})
    {
      sEcho: params[:sEcho].to_i,
      iTotalRecords: Subcontractor.count,
      iTotalDisplayRecords: subcontractors.total_entries,
      aaData: data
    }
  end

private
  def data
    subcontractors.map do |subcontractor|
      [
        link_to(subcontractor.sbcon_name, subcontractor),
        h(subcontractor.con_tel_num),
        h(subcontractor.cscs_card),
        h(subcontractor.sbcon_type),
        h(subcontractor.scot),
        h(subcontractor.ne_eng),
        h(subcontractor.nw_eng),
        h(subcontractor.mid),
        h(subcontractor.se_eng),
        h(subcontractor.sw_eng),
        h(subcontractor.ldn),
        h(subcontractor.wales),
        h(subcontractor.op_avail),
        h(subcontractor.ins_prod),
        h(subcontractor.ins_emp),
        h(subcontractor.ins_pub),
        h(subcontractor.ins_con_all),
        h(subcontractor.approved_status)
      ]
    end
  end

  def subcontractors
    @subcontractors ||= fetch_subcontractors
  end

  def fetch_subcontractors
    subcontractors = Subcontractor.order("#{sort_column} #{sort_direction}")
    subcontractors = subcontractors.page(page).per_page(per_page)
    if params[:sSearch].present?
      subcontractors = subcontractors.where("sbcon_name like :search or con_tel_num like :search", search: "%#{params[:sSearch]}%")
    end
    if filters = params[:filter]
      subcontractors = subcontractors.where(sbcon_type: filters[:type]) unless filters[:type].blank?
      subcontractors = subcontractors.where(cscs_card: filters[:cscs]) unless filters[:cscs].blank?
      subcontractors = subcontractors.where(approved_status: filters[:approved]) unless filters[:approved].blank?
    end
    subcontractors
  end

  def page
    params[:iDisplayStart].to_i/per_page + 1
  end

  def per_page
    params[:iDisplayLength].to_i > 0 ? params[:iDisplayLength].to_i : 10
  end

  def sort_column
    columns = %w[sbcon_name con_tel_num cscs_card sbcon_type scot ne_eng nw_eng mid se_eng sw_eng lon wales op_avail ins_prod ins_emp ins_pub ins_con_all approved_status]
    columns[params[:iSortCol_0].to_i]
  end

  def sort_direction
    params[:sSortDir_0] == "desc" ? "desc" : "asc"
  end
end