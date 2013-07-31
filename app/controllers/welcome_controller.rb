class WelcomeController < ApplicationController

		def index
			 Rails.logger.info '=========hellow word========='
			 puts "=========="
			 respond_to do |format|
			 	format.html
			 	format.json
			 end
		end

end