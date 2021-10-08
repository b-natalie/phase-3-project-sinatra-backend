class ChangeDateTimeToString < ActiveRecord::Migration[6.1]
  def change
    change_column :services, :time, :string
    add_column :services, :date, :string
  end
end
