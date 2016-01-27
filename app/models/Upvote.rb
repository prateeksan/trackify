class Upvote < ActiveRecord::Base
  belongs_to :user
  belongs_to :track
  validates :user_id, uniqueness: {scope: :track_id}
end