class CreateReviewsTable < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.text :comments
      t.integer :rating

      t.timestamps
    end

    add_reference :reviews, :user
    add_reference :reviews, :track
  end

end
