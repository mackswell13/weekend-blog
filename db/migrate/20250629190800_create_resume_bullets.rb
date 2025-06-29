class CreateResumeBullets < ActiveRecord::Migration[8.0]
  def change
    create_table :resume_bullets do |t|
      t.string :job_title, null: false
      t.datetime :start_date, null: false
      t.datetime :end_date
      t.string :company
      t.timestamps
    end

    add_index :resume_bullets, :job_title, unique: true
  end
end

