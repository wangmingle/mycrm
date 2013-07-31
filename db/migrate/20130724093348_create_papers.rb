class CreatePapers < ActiveRecord::Migration
  def change
    create_table :papers do |t|
      t.string :file_name
      t.string :file_path
      t.string :file_city
      t.string :file_user
      t.integer :file_status
      t.string :file_type
      t.string :file_memo

      t.timestamps
    end
  end
end
