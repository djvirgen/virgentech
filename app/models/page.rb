class Page < ActiveRecord::Base
	url_regex = /[a-zA-Z0-9\/-]/

	# Validations
	validates :url, 
		:presence => true, 
		:length => { :maximum => 200 },
		:uniqueness => { :case_sensitive => false },
		:format => {
			:with => url_regex,
    	:message => "May only contain letters, numbers, dashes and forward-slashes"
    }
    
	validates :content, 
		:presence => true, 
		:length => { 
			:maximum => 200_000
		}
end
