class Paper < ActiveRecord::Base
  attr_reader :myfile
  
  attr_accessible :file_city, :file_memo, :file_name, 
  :file_path, :file_status, :file_type, :file_user, :city_id

  belongs_to :city
end
