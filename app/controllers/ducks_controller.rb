class DucksController < ApplicationController
	before_action :require_owner! 
	before_action :set_duck, only: [:show, :update, :destroy]
	# GET /ducks
	def index
		@ducks = duck_scope.all
		json_response(@ducks)
	end	

	# POST /ducks
	def create
		@duck = duck_scope.create!(duck_params)
		json_response(@duck, :created)
	end	

	# GET /ducks/:id
	def show
		json_response(@duck)
	end
		
	# PUT /ducks/:id
	def update
		@duck.update(duck_params)
		json_response(@duck)
	end	

	# DELETE /ducks/:id
	def destroy
		@duck.destroy
		head :no_content
	end
	
	private

	def duck_scope
		@owner.ducks
	end	

	def duck_params
		# whitelist params
		params.permit(:name, :owner_id, :colour_id, :marking_id)
	end
	
	def set_duck
		@duck = duck_scope.find(params[:id])
	end		

	def require_owner!
		@owner = Owner.find_by!(api_key: params[:api_key])
	end		

end
