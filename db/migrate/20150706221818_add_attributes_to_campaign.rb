class AddAttributesToCampaign < ActiveRecord::Migration
  def change
    add_column :campaigns, :from_address, :string
    add_column :campaigns, :company_url, :string
  end
end
