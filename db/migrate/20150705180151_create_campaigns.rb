class CreateCampaigns < ActiveRecord::Migration
  def change
    create_table :campaigns do |t|
      t.string :company_name
      t.string :from_name
      t.string :background_color
      t.string :foreground_color
      t.string :reply_address

      t.timestamps null: false
    end
  end
end
