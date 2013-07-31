class DataFile < ActiveRecord::Base

	def upload(upload)
		name = upload['datafile'].original_filename
		directory = "public/upload"
		path = File.join(directory, name)
		File.open(path, "wb") { |f| f.write(upload['datafile'],read) }
	end
end