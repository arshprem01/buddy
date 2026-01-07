class CreateStudySessions < ActiveRecord::Migration[8.1]
  def change
    create_table :study_sessions do |t|
      t.references :user, null: false, foreign_key: true
      t.string :subject
      t.datetime :start_time
      t.datetime :end_time
      t.integer :duration

      t.timestamps
    end
  end
end
