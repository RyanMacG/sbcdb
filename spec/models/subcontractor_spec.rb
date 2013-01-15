require 'spec_helper'

describe Subcontractor do

  before { @sbcon = Subcontractor.new(sbcon_name: "Example Contractor",
   con_email: "con@example.com") }

  subject { @sbcon }

  it { should respond_to(:sbcon_name) }
  it { should respond_to(:address1) }
  it { should respond_to(:address2) }
  it { should respond_to(:city) }
  it { should respond_to(:county) }
  it { should respond_to(:postcode) }
  it { should respond_to(:country) }
  it { should respond_to(:con_name) }
  it { should respond_to(:con_email) }
  it { should respond_to(:utr_no) }
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
