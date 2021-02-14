class AddListingIdToReservations < ActiveRecord::Migration[6.1]
  def change
    add_column :reservations, :listing_id, :integer
    add_index :reservations, :listing_id
  end
end