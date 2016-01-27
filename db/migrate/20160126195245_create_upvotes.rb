class CreateUpvotes < ActiveRecord::Migration
  def change
    create_table :upvotes do |t|

    end

    add_reference :upvotes, :track
    add_reference :upvotes, :user
  end
end
