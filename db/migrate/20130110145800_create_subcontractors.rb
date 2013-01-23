class CreateSubcontractors < ActiveRecord::Migration
  def change
    create_table :subcontractors do |t|
      t.string  :sbcon_name
      t.string  :address1
      t.string  :address2
      t.string  :city
      t.string  :county
      t.string  :postcode
      t.string  :country
      t.string  :con_name
      t.string  :con_tel_num
      t.string  :con_email
      t.string  :utr_no
      t.string  :cr_ni_no
      t.string  :vat_reg
      t.string  :vat_no
      t.string  :cscs_card
      t.string  :op_avail
      t.float   :hr_rate_fitter
      t.float   :hr_rate_other
      t.string  :scot
      t.string  :ne_eng
      t.string  :nw_eng
      t.string  :mid
      t.string  :wales
      t.string  :se_eng
      t.string  :sw_eng
      t.string  :ldn
      t.string  :ins_prod
      t.string  :ins_emp
      t.string  :prov_prod
      t.string  :prov_emp
      t.string  :ref_prod
      t.string  :ref_emp
      t.string  :amnt_prod
      t.string  :amnt_emp
      t.date    :exp_date_prod
      t.date    :exp_date_emp
      t.string  :ins_pub
      t.string  :ins_con_all
      t.string  :prov_pub
      t.string  :prov_con_all
      t.string  :ref_pub
      t.string  :ref_con_all
      t.string  :amnt_pub
      t.string  :amnt_con_all
      t.date    :exp_date_pub
      t.date    :exp_date_con_all
      t.string  :acpt_tc
      t.string  :hs_pol
      t.string  :meth_state
      t.string  :risk_ass
      t.string  :comments
      t.string  :signed
      t.date    :signed_date
      t.string  :position
      t.date    :date_entered
      t.date    :renewal_date
      t.string  :initials
      t.string  :approved_status
      t.string  :sbcon_type
      t.string  :rating
      t.string  :cis_ver_no
      t.string  :cis_stat
      t.string  :jtc_comm

      t.timestamps
    end
  end
end
