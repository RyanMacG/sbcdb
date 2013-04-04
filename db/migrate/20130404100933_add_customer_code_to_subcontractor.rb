class AddCustomerCodeToSubcontractor < ActiveRecord::Migration
  def change
    add_column :subcontractors, :customer_code, :string
  end
end
