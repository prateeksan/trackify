class Track < ActiveRecord::Base
  belongs_to :user
  has_many :upvotes
  has_many :reviews
  validates :title, :author, presence: true
  validates :url, format: {with: /\A(https?:\/\/)?www\..+\..*\z/, message: "must be in proper format"}, allow_blank: true
end