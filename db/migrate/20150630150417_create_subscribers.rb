class CreateSubscribers < ActiveRecord::Migration
  def change
    create_table :subscribers do |t|
      t.string :email
      t.string :name
      t.datetime :subscription_date
      t.belongs_to :mailchimp_list, index: true

      t.timestamps null: false
    end
    add_foreign_key :subscribers, :mailchimp_lists
  end
end
