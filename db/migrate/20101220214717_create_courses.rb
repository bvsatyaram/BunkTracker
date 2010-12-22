class CreateCourses < ActiveRecord::Migration
  def self.up
    create_table :courses do |t|
      t.string :title
      t.integer :credits
      t.belongs_to :semester

      t.timestamps
    end
  end

  def self.down
    drop_table :courses
  end
end
