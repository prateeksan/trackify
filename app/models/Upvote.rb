class Upvote < ActiveRecord::Base
  validates :user_id, uniqueness: {scope: :track_id}
end