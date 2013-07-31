class AddLinkToCustomer < ActiveRecord::Migration
  def change
    add_column :customers, :link, :text
    add_column :customers, :zhiwu, :text
    add_column :customers, :dh, :text
    add_column :customers, :sj, :text
    add_column :customers, :em, :text
    add_column :customers, :cz, :text
    add_column :customers, :bz, :text
  end
end
