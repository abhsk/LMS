module FlashHelper
	def flash_message
		[:alert, :notice, :info].collect do |message_type|
     		 message = flash.discard(message_type)
     		 next unless message

     		 content_tag :p, message
    	end.join.html_safe
	end
end
