class List < ActiveRecord::Base
  belongs_to :user
  validates :title, presence: true
  validates :user_id, presence: true
  has_many :list_items
end
