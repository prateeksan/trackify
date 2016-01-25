class Track < ActiveRecord::Base
  validates :title, :author, presence: true
  validates :url, format: {with: /\A(https?:\/\/)?www\..+\..*\z/, message: "must be in url format"}, allow_blank: true
end