class CreateMailchimpLists < ActiveRecord::Migration
  def change
    create_table :mailchimp_lists do |t|
      t.string :mailchimp_id
      t.string :name
      t.belongs_to :user, index: true

      t.timestamps null: false
    end
    add_foreign_key :mailchimp_lists, :users
  end
end
