class CreateAccessTokens < ActiveRecord::Migration
  def change
    create_table :access_tokens do |t|
      t.string :access_token
      t.datetime :expires_at
      t.belongs_to :user, index: true

      t.timestamps null: false
    end
    add_foreign_key :access_tokens, :users
  end
end
