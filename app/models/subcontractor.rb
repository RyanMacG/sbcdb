class Subcontractor < ActiveRecord::Base
  attr_accessible :acpt_tc, :address1, :address2, :amnt_con_all, :amnt_emp, :amnt_prod,
  :amnt_pub, :approved_status, :cis_stat, :cis_ver_no, :city, :comments, :con_email, :con_name,
  :con_tel_num, :county, :country, :cr_ni_no, :cscs_card, :date_entered, :exp_date_con_all,
  :exp_date_emp, :exp_date_pub, :hr_rate_fitter, :hr_rate_other, :hs_pol, :initials,
  :ins_con_all, :ins_emp, :ins_prod, :ins_pub, :jtc_comm, :ldn, :meth_state, :mid, :ne_eng,
  :nw_eng, :wales, :op_avail, :position, :postcode, :prov_prod, :exp_date_prod, :prov_con_all, :prov_emp, :prov_pub, :rating, :ref_con_all,
  :ref_emp, :ref_prod, :ref_pub, :renewal_date, :risk_ass, :sbcon_name,
  :sbcon_type, :scot, :se_eng, :signed, :signed_date, :sw_eng, :utr_no, :vat_no, :vat_reg

  validates_presence_of :sbcon_name, :con_email, :address1, :city, :postcode,
  :country, :con_name, :con_tel_num, :vat_reg, :utr_no, :cr_ni_no, :cscs_card,
  :op_avail, :hr_rate_fitter, :hr_rate_other, :ins_prod, :ins_emp, :ins_pub,
  :ins_con_all, :acpt_tc, :hs_pol, :meth_state, :risk_ass, :signed, :signed_date,
  :position, :date_entered, :initials, :renewal_date, :approved_status, :sbcon_type,
  :rating, :cis_ver_no, :cis_stat

  validates :sbcon_name, length: { maximum: 50 }
  validates :con_name, length: { maximum: 50 }

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :con_email, format: { with: VALID_EMAIL_REGEX }

  VALID_PHONE_REGEX = /\A[0]\d{10}\z/
  validates :con_tel_num, length: { is: 11 },
                          format: { with: VALID_PHONE_REGEX }

  validates :initials, length: { maximum: 6 }
  validates :utr_no, length: { is: 10 }
end
# == Schema Information
#
# Table name: subcontractors
#
#  id               :integer(4)      not null, primary key
#  sbcon_name       :string(255)
#  address1         :string(255)
#  address2         :string(255)
#  city             :string(255)
#  county           :string(255)
#  postcode         :string(255)
#  country          :string(255)
#  con_name         :string(255)
#  con_tel_num      :string(255)
#  con_email        :string(255)
#  utr_no           :string(255)
#  cr_ni_no         :string(255)
#  vat_reg          :string(255)
#  vat_no           :string(255)
#  cscs_card        :string(255)
#  op_avail         :string(255)
#  hr_rate_fitter   :integer
#  hr_rate_other    :integer
#  scot             :string(255)
#  ne_eng           :string(255)
#  nw_eng           :string(255)
#  mid              :string(255)
#  wales            :string(255)
#  se_eng           :string(255)
#  sw_eng           :string(255)
#  ldn              :string(255)
#  ins_prod         :string(255)
#  ins_emp          :string(255)
#  prov_prod        :string(255)
#  prov_emp         :string(255)
#  ref_prod         :string(255)
#  ref_emp          :string(255)
#  amnt_prod        :string(255)
#  amnt_emp         :string(255)
#  exp_date_prod    :date
#  exp_date_emp     :date
#  ins_pub          :string(255)
#  ins_con_all      :string(255)
#  prov_pub         :string(255)
#  prov_con_all     :string(255)
#  ref_pub          :string(255)
#  ref_con_all      :string(255)
#  amnt_pub         :string(255)
#  amnt_con_all     :string(255)
#  exp_date_pub     :date
#  exp_date_con_all :date
#  acpt_tc          :string(255)
#  hs_pol           :string(255)
#  meth_state       :string(255)
#  risk_ass         :string(255)
#  comments         :string(255)
#  signed           :string(255)
#  signed_date      :date
#  position         :string(255)
#  date_entered     :date
#  renewal_date     :date
#  initials         :string(255)
#  approved_status  :string(255)
#  sbcon_type       :string(255)
#  rating           :string(255)
#  cis_ver_no       :string(255)
#  cis_stat         :string(255)
#  jtc_comm         :string(255)
#  created_at       :datetime        not null
#  updated_at       :datetime        not null
#
