class Student < ApplicationRecord
  validates :name, :major, :instructor_id, presence: true
  validates :age, numericality: { greater_than_or_equal_to: 18, message: "Must be between 18 or older"}

  belongs_to :instructor
end
