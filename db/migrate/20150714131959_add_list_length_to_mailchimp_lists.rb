class AddListLengthToMailchimpLists < ActiveRecord::Migration
  def change
    add_column :mailchimp_lists, :list_length, :integer
  end
end
