module ExceptionHandler
	extend ActiveSupport::Concern

	included do 
		rescue_from ActiveRecord::RecordNotFound do |event|
			json_response({ message: event.message }, :not_found)
		end

		rescue_from ActiveRecord::RecordInvalid do |event|
			json_response({ message: event.message }, :unprocessable_entity)
		end
	end
end			