class Track < ActiveRecord::Base
  belongs_to :user
  validates :title, :author, presence: true
  validates :url, format: {with: /\A(https?:\/\/)?www\..+\..*\z/, message: "must be in proper format"}, allow_blank: true
end