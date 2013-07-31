class AddPaperToCity < ActiveRecord::Migration
  def change
    add_column :cities, :city_id, :integer
  end
end
