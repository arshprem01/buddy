class CreateBreaks < ActiveRecord::Migration[8.1]
  def change
    create_table :breaks do |t|
      t.references :study_session, null: false, foreign_key: true
      t.string :break_type
      t.integer :duration

      t.timestamps
    end
  end
end
