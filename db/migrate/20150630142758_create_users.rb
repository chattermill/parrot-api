class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.integer :mailchimp_id
      t.string :account_name
      t.string :login
      t.string :mailchimp_auth_token
      t.string :mailchimp_data_center

      t.timestamps null: false
    end
  end
end
