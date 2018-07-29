class Ticket < ActiveRecord::Base
  belongs_to :store, counter_cache: true
  # belongs_to :received_user, foreign_key: "received_user_id", class_name: "User"
  # belongs_to :assigned_user, foreign_key: "assign_user_id", class_name: "User"
  belongs_to :received_user, class_name: "User"
  belongs_to :assign_user, class_name: "User"

  validates :title, presence: true, length: { maximum: 20 }
  validates :status, presence: true
  validates :receive_date, presence: true
  validates :receive_time, presence: true
  validates :limit_date, presence: true
  validates :content, length: { maximum: 50 }
  validates :result, length: { maximum: 50 }

end
