class CreateSurveys < ActiveRecord::Migration
  def change
    create_table :surveys do |t|
      t.belongs_to :subscriber, index: true, foreign_key: true
      t.belongs_to :campaign, index: true, foreign_key: true
      t.string :token

      t.timestamps null: false
    end
  end
end
