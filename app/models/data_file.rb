class DataFile < ActiveRecord::Base

	def self.save(upload)
		name = nil
		if upload[:file_path].present?
			name = upload[:file_path].original_filename
			directory = "/Users/miller/Pictures/upload"
			path = File.join(directory, name)
			File.open(path, "wb") { |f| f.write(upload[:file_path].read) }
			return name
		end
	end
end