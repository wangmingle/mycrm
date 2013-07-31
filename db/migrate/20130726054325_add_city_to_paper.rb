class AddCityToPaper < ActiveRecord::Migration
  def change
    add_column :papers, :city_id, :integer
  end
end
