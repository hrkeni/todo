class ListItem < ActiveRecord::Base
  belongs_to :list

  validates :list, presence: true
  validates :title, presence: true
  enum state: [ :not_started, :in_progress, :completed]
end
