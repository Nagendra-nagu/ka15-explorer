class AddPositionAndLocationToPosts < ActiveRecord::Migration[7.1]
  def change
    add_column :posts, :position, :integer
    add_column :posts, :location, :string
  end
end
