require 'spec_helper'

describe Subcontractor do

  before { @sbcon = Subcontractor.new(sbcon_name: "Example Contractor",
   con_email: "con@example.com", address1: "1 Example Street", city: "Dundee",
   postcode: "DD2 3SN", country: "UK", con_name: "Doris", con_tel_num: "01382427400",
   vat_reg: "no", utr_no: "1234567890", cr_ni_no: "BB XX 33 42", cscs_card: "yes",
   op_avail: "4", hr_rate_fitter: "6.52", hr_rate_other: "0", ins_prod: "no", ins_emp: "no",
   ins_pub: "yes", prov_pub: "Axa", amnt_pub: "50000", ref_pub: "A3002",
   exp_date_pub: "16/01/2015", ins_con_all: "no", acpt_tc: "yes", hs_pol: "use JTC's",
   meth_state: "yes", risk_ass: "no", signed: "Jimmy Blogs", signed_date: "13/01/2013",
   position: "Manager", date_entered: "16/01/2013", initials: "KT", renewal_date: "16/01/2013",
   approved_status: "yes", sbcon_type: "Labour Only", rating: "4", cis_ver_no: "4567",
   cis_stat: "0.00%", jtc_comm: "Previously completed 5 contracts for us") }

  subject { @sbcon }

  it { should be_valid }

  describe "when sbcon name is not present" do
    before { @sbcon.sbcon_name = " " }
    it { should_not be_valid }
  end

  describe "when email isn't present" do
    before { @sbcon.con_email = " " }
    it { should_not be_valid }
  end

  describe "when names are too long" do
    before { @sbcon.sbcon_name = "a" * 51 }
    before { @sbcon.con_name = "a" * 51 }
    it { should_not be_valid }
  end

  describe "email" do
    describe "when email format is invalid" do
      it "should be invalid" do
        email_add = %w[user@foo,com user_at_foo.org example.user@foo.
                        foo@bar_baz.com foo@bar+baz.com]
        email_add.each do |invalid_address|
          @sbcon.con_email = invalid_address
          @sbcon.should_not be_valid
        end
      end
    end

    describe "when email is valid" do
      it "should be valid" do
        email_add = %w[user@foo.COM A_US-ER@f.b.org frst.lst@foo.jp a+b@baz.cn]
        email_add.each do |valid_address|
          @sbcon.con_email = valid_address
          @sbcon.should be_valid
        end
      end
    end
  end

  describe "phone numbers" do
    describe "when phone number is too long" do
      before { @sbcon.con_tel_num = "1" * 12 }
      it { should_not be_valid }
    end

    describe "when phone number is too short" do
      before { @sbcon.con_tel_num = "2" * 10 }
      it { should_not be_valid }
    end

    describe "invalid phone number" do
      it "should be invalid" do
        phone_nr = %w[!s345w34t4@ PHOTOREDUCE 12345678901]
        phone_nr.each do |invalid_number|
          @sbcon.con_tel_num = invalid_number
          @sbcon.should_not be_valid
        end
      end
    end

    describe "valid phone number" do
      it "should be valid" do
        phone_nr = %w[01382427400 01315555555]
        phone_nr.each do |valid_number|
          @sbcon.con_tel_num = valid_number
          @sbcon.should be_valid
        end
      end
    end
  end

  describe "when there are too many initials" do
    before { @sbcon.initials = "a" * 7 }
    it { should_not be_valid }
  end

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
