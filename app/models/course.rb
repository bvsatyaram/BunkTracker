class Course < ActiveRecord::Base
  validates_presence_of :title, :credits
  validates_numericality_of :credits

  belongs_to :semester
end
