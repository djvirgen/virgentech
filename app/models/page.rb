class Page < ActiveRecord::Base
	# Validations
	validates :url, 
		:presence => true, 
		:length => { :maximum => 200 },
		:format => { 
			:with => /[a-zA-Z0-9\/-]/,
    	:message => "May only contain letters, numbers, dashes and forward-slashes"
    }
    
	validates :content, 
		:presence => true, 
		:length => { 
			:maximum => 200_000
		}
end
