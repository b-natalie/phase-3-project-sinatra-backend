class AddInstructorToReserversations < ActiveRecord::Migration[6.1]
  def change
    add_column :reservations, :instructor, :string
  end
 end
