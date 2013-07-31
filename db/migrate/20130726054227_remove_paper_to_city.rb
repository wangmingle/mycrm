class RemovePaperToCity < ActiveRecord::Migration
  def up
    remove_column :cities, :city_id
  end

  def down
    add_column :cities, :city_id, :integer
  end
end
