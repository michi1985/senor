class Store < ActiveRecord::Base
  belongs_to :customer, counter_cache: true
  has_many :tickets

  validates :store_code,  presence: true, length: { is: 6 }, uniqueness: {scope: :customer_id}
  validates :store_name,  presence: true, length: { maximum: 20 }

  geocoded_by :complete_address
  after_validation :geocode

  prefectures = :prefectures
  city = :city
  town_name = :town_name

def complete_address
  complete_address = prefectures + city + town_name
end


end
