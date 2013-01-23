require 'spec_helper'

describe "SubcontractorPages" do
  subject { page }

  describe "Subcontractor show page" do
    let(:subcontractor) { FactoryGirl.create(:subcontractor) }
    before { visit subcontractor_path(subcontractor) }

    it { should have_selector('h1', text: subcontractor.sbcon_name) }
    it { should have_selector('title', text: subcontractor.sbcon_name) }
  end

  describe "Subcontractor creation" do
    
    let(:submit) { "Submit" }
    before { visit new_path }
    
    describe "with invalid info" do
      it "should not create a user" do
        expect { click_button submit }.not_to change(Subcontractor, :count)
      end
    end
    
    describe "with valid info" do
      before do
        fill_in "Name",                         with: "New Subcontractor"
        fill_in "Contact Name",                 with: "Edith Banks"
        fill_in "Contact Email",                with: "edith.banks@example.org"
        fill_in "Contact Telephone Number",     with: "01382427404"
        fill_in "Address Line 1",               with: "Unit 5"
        fill_in "Address Line 2",               with: "Manhattan Works"
        fill_in "Town/City",                    with: "Dundee"
        fill_in "Postcode",                     with: "DD4 3BD"
        fill_in "County",                       with: "Angus"
        fill_in "Country",                      with: "UK"
        select  "Yes",                          from: "VAT Registered"
        fill_in "VAT No.",                      with: "GB46003322"
        fill_in "UTR No.",                      with: "1234567890"
        fill_in "CR/NI No.",                    with: "XX YY 11 22"
        fill_in "CSCS Card?",                   with: "Yes"
        fill_in "Available Operatives",         with: "6"
        fill_in "Hourly Rate (Fitter)",         with: "8.61"
        fill_in "Hourly Rate (Other)",          with: "8.21"
        select  "Yes",                          from: "Scotland"
        select  "Yes",                          from: "North East England"
        select  "Yes",                          from: "North West England"
        select  "No",                           from: "South East England"
        select  "No",                           from: "South West England"
        select  "No",                           from: "Midlands"
        select  "No",                           from: "Wales"
        select  "No",                           from: "London"
        select  "Yes",                          from: "Product Liability"
        select  "No",                           from: "Employer Liability"
        fill_in "Provider (Product)",           with: "Axa"
        fill_in "Provider (Employer)",          with: "N/A"
        fill_in "Reference No. (Product)",      with: "A332356"
        fill_in "Reference No. (Employer)",     with: "N/A"
        fill_in "Cover Amount (Product)",       with: "300000"
        fill_in "Cover Amount (Employer)",      with: " "
        fill_in "Expiry Date (Product)",        with: "21/12/14"
        select  "No",                           from: "Public Liability"
        select  "No",                           from: "Contractors All Risk"
        fill_in "Provider (Public)",            with: "N/A"
        fill_in "Provider (Contractors)",       with: "N/A"
        fill_in "Reference No. (Public)",       with: "N/A"
        fill_in "Reference No. (Contractors)",  with: "N/A"
        fill_in "Cover Amount (Public)",        with: " "
        fill_in "Cover Amount (Contractors)",   with: " "
        select  "Yes",                          from: "Accept T&C"
        select  "Yes",                          from: "Health & Safety Policy"
        select  "Use JTC's",                    from: "Method Statements"
        select  "Yes",                          from: "Risk Assements"
        fill_in "Additional Comments",          with: "Completed 3 previous JTC jobs"
        fill_in "Signed by",                    with: "New Subcontractor"
        fill_in "Date",                         with: "17/01/13"
        fill_in "Position",                     with: "Manager"
        fill_in "Date Entered",                 with: "21/01/13"
        fill_in "Renewal Date",                 with: "21/01/14"
        fill_in "Initials",                     with: "KWT"
        select  "Approved",                     from: "Subcontractor Status"
        select  "Labour Only",                  from: "Subcontractor Type"
        select  "4",                            from: "Rating"
        fill_in "CIS Verification No.",         with: "4567"
        select  "20.00%",                       from: "CIS Status"
        fill_in "JTC Comments",                 with: "Work on previous jobs was good"
      end

      it "should create a user" do
        expect { click_button submit }.to change(Subcontractor, :count).by(1)
      end
    end
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
