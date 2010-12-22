class Semester < ActiveRecord::Base
  validates_presence_of :start_date, :end_date, :min_percentage
  validate :end_date_after_start_date
  validate :min_percentage_within_limits
  validates_numericality_of :min_percentage

  has_many :courses
  accepts_nested_attributes_for :courses

  private
  def end_date_after_start_date
    errors.add(:end_date, "should be past start date") if start_date && end_date && (start_date >= end_date)
  end

  def min_percentage_within_limits
    errors.add(:min_percentage, "should be positive") if min_percentage && (min_percentage < 0)
    errors.add(:min_percentage, "should be less than 95") if min_percentage && (min_percentage > 95)
  end
end
