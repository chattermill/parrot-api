class CreateSurveyResponses < ActiveRecord::Migration
  def change
    create_table :survey_responses do |t|
      t.integer :score
      t.text :body
      t.belongs_to :survey, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
