FactoryGirl.define do
  factory :subcontractor do
  sbcon_name: "Example Contractor",
  con_email: "con@example.com", address1: "1 Example Street", city: "Dundee",
  postcode: "DD2 3SN", country: "UK", con_name: "Doris", con_tel_num: "01382427400",
  vat_reg: "no", utr_no: "1234567890", cr_ni_no: "BB XX 33 42", cscs_card: "yes",
  op_avail: "4", hr_rate_fitter: "6.52", hr_rate_other: "0", ins_prod: "no", ins_emp: "no",
  ins_pub: "yes", prov_pub: "Axa", amnt_pub: "50000", ref_pub: "A3002",
  exp_date_pub: "16/01/2015", ins_con_all: "no", acpt_tc: "yes", hs_pol: "use JTC's",
  meth_state: "yes", risk_ass: "no", signed: "Jimmy Blogs", signed_date: "13/01/2013",
  position: "Manager", date_entered: "16/01/2013", initials: "KT",
  renewal_date: "16/01/2013", approved_status: "yes", sbcon_type: "Labour Only",
  rating: "4", cis_ver_no: "4567", cis_stat: "0.00%",
  jtc_comm: "Previously completed 5 contracts for us"
 end
end