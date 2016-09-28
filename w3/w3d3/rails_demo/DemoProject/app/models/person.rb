class Person < ActiveRecord::Base
  validates :f_name, presence: true
  validates :l_name, presence: true
  validates :dob, presence: true

  belongs_to(
    :home,
    class_name: :House,
    foreign_key: :house_id,
    primary_key: :id
  )
end
