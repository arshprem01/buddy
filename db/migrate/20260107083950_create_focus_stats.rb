class CreateFocusStats < ActiveRecord::Migration[8.1]
  def change
    create_table :focus_stats do |t|
      t.references :user, null: false, foreign_key: true
      t.date :date
      t.integer :total_study_minutes
      t.string :burnout_score

      t.timestamps
    end
  end
end
