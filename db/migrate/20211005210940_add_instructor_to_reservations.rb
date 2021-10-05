class AddInstructorToReservations < ActiveRecord::Migration[6.1]
  def change
    add_column :services, :instructor, :string
  end
end
