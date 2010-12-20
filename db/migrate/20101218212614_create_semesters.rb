class CreateSemesters < ActiveRecord::Migration
  def self.up
    create_table :semesters do |t|
      t.date :start_date
      t.date :end_date
      t.integer :min_percentage

      t.timestamps
    end
  end

  def self.down
    drop_table :semesters
  end
end
