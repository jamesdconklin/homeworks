class House < ActiveRecord::Base
  validates :address, presence: true

  has_many(
    :occupants,
    class_name: :Person,
    foreign_key: :house_id,
    primary_key: :id
  )
end
